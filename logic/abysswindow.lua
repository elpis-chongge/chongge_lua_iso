require("Abyss_AbyssWindowByName")
require("Abyss_CardTaskByName")
local AbyssWindow = {}
local uis, contentPane, branchesCache, activitiesCache, focusCache, minimap, fowMask, mapflags, playerflag, flagscale, cursors, cursorRoot, eventOverlapsCollection, softMask, eventTipsRoot, eventsBuffer, tipsVersion
local enablePopupEventTips, eventTipsVisible = false, true
local busy = false
local unlockedFunctions
local FuncList = {
  [FEATURE_ENUM.ABYSS_FUNC_INDEX] = {
    id = FEATURE_ENUM.ABYSS_FUNC_INDEX,
    sort = 1,
    btnTitle = T(20076),
    btnSubtitle = T(20202),
    btnURL = "ui://Abyss/ActivityBtn",
    btnOnClick = function()
      if busy then
        return
      end
      AbyssExploreChrCtrl.StopMovingAfter(1)
      OpenWindow(WinResConfig.AbyssActivityWindow.name)
    end
  },
  [FEATURE_ENUM.ABYSS_SHOP] = {
    id = FEATURE_ENUM.ABYSS_SHOP,
    sort = 2,
    btnTitle = T(20010),
    btnSubtitle = T(20203),
    btnURL = "ui://Abyss/ShopBtn",
    btnOnClick = function()
      if busy then
        return
      end
      AbyssExploreChrCtrl.StopMovingAfter(1)
      AbyssExploreService.ShopInfoReq()
    end
  },
  [FEATURE_ENUM.ABYSS_CHA_PLOT] = {
    id = FEATURE_ENUM.ABYSS_CHA_PLOT,
    sort = 3,
    btnTitle = T(20003),
    btnURL = "ui://Abyss/CardPlotBtn",
    btnOnClick = function()
      if busy then
        return
      end
      AbyssExploreChrCtrl.StopMovingAfter(1)
      OpenWindow(WinResConfig.CardPlotMainWindow.name)
    end
  }
}
local sortingBuffer
local new_gobj_list = CS.System.Collections.Generic.List(CS.FairyGUI.GObject)
local SortMapflags = function()
  if mapflags then
    local parent = minimap:GetChild("BigMapEventPic")
    sortingBuffer = sortingBuffer or new_gobj_list(#mapflags)
    sortingBuffer:Clear()
    table.sort(mapflags, function(x, y)
      return x.ratioy > y.ratioy
    end)
    for i, v in ipairs(mapflags) do
      sortingBuffer:Add(v.gobj)
    end
    parent:ChangeChildrenOrder(sortingBuffer)
  end
end
local DisplayGridEventOverlapsIfNecessary = function(x, y)
  local num, grid = AbyssExploreMgr.GetEventOverlaps(x, y)
  if type(num) == "number" then
    eventOverlapsCollection = eventOverlapsCollection or {}
    local key = grid.gridId
    local gobj = eventOverlapsCollection[key]
    if num > 0 then
      if not gobj then
        gobj = UIMgr:CreateObject("Abyss", "MapOverlap")
        gobj:SetPivot(0.4, 0.252, true)
        cursorRoot:AddChild(gobj)
        eventOverlapsCollection[key] = gobj
      end
      local eventInfo = grid.userdata
      gobj.visible = eventInfo.hasRes
      gobj:GetChild("NumberTxt").text = num
      local screenPos = AbyssExploreMgr.WorldToScreenPoint(grid.center)
      local position = cursorRoot:RootToLocal(screenPos)
      gobj:SetXY(position.x, position.y)
    elseif gobj then
      gobj.visible = false
    end
  end
end
local DisplayGridEventOverlapsIfNecessary_Event = function(eventInfo)
  if eventInfo.positions and 1 == #eventInfo.positions then
    for i, v in pairs(eventInfo.positions) do
      DisplayGridEventOverlapsIfNecessary(v.x, v.y)
    end
  end
end
local OnEventCreate = function(grid, eventInfo, initializing)
  local sub = minimap:GetChild("BigMapPic")
  local flagparent = minimap:GetChild("BigMapEventPic")
  local mapObj = sub:GetChild("BigMapPic1")
  local inst = AbyssExploreMapflag.CreateMapflagWithEventInfo(eventInfo, flagparent, mapObj, Vector2(0.5, 0.5), true, flagscale)
  if inst then
    inst.gobj:GetChild("EventChoice").visible = false
    if softMask then
      softMask:MaskGObject(inst.gobj)
    end
    table.insert(mapflags, inst)
    if playerflag then
      playerflag:set2last()
    end
    SortMapflags()
  end
end
local OnEventDelete = function(grid, eventInfo)
  local cnt = mapflags and #mapflags or 0
  for i = cnt, 1, -1 do
    if mapflags[i].userdata.eventId == eventInfo.eventId then
      local flag = table.remove(mapflags, i)
      if softMask then
        softMask:RemoveGObject(flag.gobj)
      end
      flag:delete()
      break
    end
  end
  if eventsBuffer then
    for i = 1, #eventsBuffer do
      if eventsBuffer[i] == eventInfo then
        table.remove(eventsBuffer, i)
        local list = eventTipsRoot:GetChild("EventTipsList")
        list:RemoveChildToPoolAt(i - 1)
        break
      end
    end
  end
  if eventOverlapsCollection and eventInfo.positions and 1 == #eventInfo.positions then
    for i, v in pairs(eventInfo.positions) do
      local num, g = AbyssExploreMgr.GetEventOverlaps(v.x, v.y)
      local key = g.gridId
      if eventOverlapsCollection[key] then
        local gobj = eventOverlapsCollection[key]
        gobj.visible = false
        if num < 1 then
          eventOverlapsCollection[key] = nil
          gobj:Dispose()
        end
      end
    end
  end
end
local OnEventResLoaded = function(eventInfo)
  DisplayGridEventOverlapsIfNecessary_Event(eventInfo)
end
local OnEventOverlap = function(grid)
  local coordinate = CS.MapGrid.getCoordinate(grid.gridId)
  DisplayGridEventOverlapsIfNecessary(coordinate.x, coordinate.y)
end
local TaskProvider = function(i)
  return "ui://Abyss/CardTask"
end
local TaskRenderer = function(i, item)
  local branchIndex = i + 1
  local branch = branchesCache[branchIndex]
  local config = TableData.GetConfig(branch.nextPlotNodeId, "BaseManorNode")
  local nameText, descText
  if config then
    nameText = config.name()
    descText = config.des()
  else
    nameText = "任务" .. tostring(branch.eventId)
    descText = "任务参数" .. tostring(branch.param) .. "\n当前结点" .. tostring(branch.nextPlotNodeId)
  end
  UIUtil.SetText(item, nameText, "NameTxt")
  UIUtil.SetText(item, descText, "WordTxt")
  local dirBtn = item:GetChild("TaskDirectionBtn")
  local time = item:GetChild("Time")
  UIUtil.SetText(dirBtn, T(20360), "DistanceTxt")
  if type(branch.deadlineTimestamp) == "number" then
    local diff = math.max(0, branch.deadlineTimestamp - LoginData.GetCurServerTime())
    local timeText = TimeUtil.FormatEnTime(diff)
    UIUtil.SetText(time, T(20520, timeText), "TimeTxt")
  end
  ChangeUIController(item, "c1", branch.type == AbyssExploreEventID.BRANCH_ACTIVITY and 1 or 0)
  dirBtn.onClick:Set(function()
    if AbyssExploreMgr.IsGesturable() then
      AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.GOTO_EVENT, branch)
    end
  end)
end
local RefreshTaskList = function()
  local tasklist = uis.Main.TaskList
  tasklist.itemProvider = TaskProvider
  tasklist.itemRenderer = TaskRenderer
  tasklist.opaque = false
  table.sort(branchesCache, function(x, y)
    return x.type * x.eventId > y.type * y.eventId
  end)
  local numBranches = #branchesCache
  tasklist.numItems = numBranches
end
local RefreshBranchesPathInfo = function(i, eventInfo, steps, angle)
  local list = uis.Main.TaskList
  local index = i - 1
  if index >= list.numItems then
    return
  end
  local child = list:GetChildAt(index)
  local dirBtn = child:GetChild("TaskDirectionBtn")
  local arrow = dirBtn:GetChild("Arrow")
  arrow.rotation = angle
  local deadlineTimestamp = eventInfo.deadlineTimestamp
  if type(deadlineTimestamp) == "number" then
    local time = child:GetChild("Time")
    local diff = math.max(0, deadlineTimestamp - LoginData.GetCurServerTime())
    local timeText = TimeUtil.FormatEnTime(diff)
    UIUtil.SetText(time, T(20520, timeText), "TimeTxt")
  end
end
local OnChrStartMoving = function()
  if not eventTipsRoot then
    return
  end
  AbyssEventList.ClearEventTips(eventTipsRoot, true, nil, true)
end
local OnPopupEventTips = function(events)
  if not enablePopupEventTips then
    return
  end
  local parent = uis.Main.root
  if not eventTipsRoot then
    eventTipsRoot = UIMgr:CreateObject("Abyss", "EventTipsList")
    eventTipsRoot.opaque = false
    local childIndex = parent:GetChildIndex(uis.Main.BackGround.root)
    parent:AddChildAt(eventTipsRoot, childIndex + 1)
    AbyssEventList.Reset(eventTipsRoot)
  end
  AbyssEventList.PopupEventList(eventTipsRoot, events)
end
local eventTipsPositionOffset = Vector3(0.5, 0, 0)
local UpdateEventTipsPosition = function()
  if eventTipsRoot and eventTipsRoot.visible then
    local position = AbyssExploreChrCtrl.GetPosition()
    position = position + eventTipsPositionOffset
    local sp = AbyssExploreMgr.WorldToScreenPoint(position)
    local parent = uis.Main.root
    local lp = parent:RootToLocal(sp)
    eventTipsRoot:SetXY(lp.x, lp.y)
  end
end
local DisplayHourglass = function(gcmp)
  local n1 = gcmp:GetChild("n1")
  local hourglass = gcmp:GetChild("hourglass")
  if not hourglass then
    local holder = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
    holder.name = "hourglass"
    local eff = ResourceManager.Instantiate("Assets/Art/Models/UI_spine/prefab/ui_timeword_hourglass_yellow.prefab")
    UIUtil.SetObjectToUI(eff, holder, 12000)
    local transform = eff.transform
    transform.localPosition = Vector3(n1.width * 0.5, -n1.height * 0.5)
    gcmp:AddChild(holder)
    hourglass = holder
  end
  if n1 then
    local position = n1.position
    hourglass:SetXY(position.x, position.y)
    n1.visible = false
  end
end
local cursorPositionOffset = Vector3(0, 0, 0)
local UpdateCursors = function()
  if cursors then
    local events = AbyssExploreData.GetAllEvents()
    if type(events) ~= "table" then
      return
    end
    local cursorParent = cursorRoot
    for _, cursor in ipairs(cursors) do
      local gobj = cursor.gobj
      local id = cursor.eventId
      local event = events[id]
      if event then
        local e_type = event.type
        if e_type == AbyssExploreEventID.BUILDING or e_type == AbyssExploreEventID.FROST_DUNGEON then
          local open, startTimestamp = AbyssExploreMgr.EventFeatureIsOpen(e_type)
          local serverTime = LoginData.GetCurServerTime()
          local diff = startTimestamp - serverTime
          if not open and diff > 0 then
            local subgcmp = gobj:GetChild("MapBuildTime")
            UIUtil.SetText(subgcmp, T(20333, TimeUtil.FormatEnTime(diff)), "TimeTxt")
            DisplayHourglass(subgcmp)
            ChangeUIController(gobj, "c2", 1)
          else
            ChangeUIController(gobj, "c2", 0)
          end
        elseif e_type == AbyssExploreEventID.GUILD_WAR_ENTRANCE then
          local scheduleInfo = GuildWarData.GetGuildScheduleInfo()
          if scheduleInfo then
            local state = scheduleInfo.state
            local endStamp = scheduleInfo.endStamp
            local subgcmp = gobj:GetChild("MapBuildTime")
            if state == ProtoEnum.GuildWarState.GWS_NOTICE or state == ProtoEnum.GuildWarState.GWS_FIGHT then
              DisplayHourglass(subgcmp)
              ChangeUIController(gobj, "c2", 1)
              ChangeUIController(gobj, "c4", 0)
              local refresh
              if state == ProtoEnum.GuildWarState.GWS_NOTICE then
                local startDiff = endStamp + 1 - LoginData.GetCurServerTime()
                if startDiff >= 0 then
                  UIUtil.SetText(subgcmp, T(20537, TimeUtil.FormatEnTime(startDiff)), "TimeTxt")
                else
                  refresh = true
                end
              else
                local endDiff = endStamp - LoginData.GetCurServerTime()
                if endDiff >= 0 then
                  UIUtil.SetText(subgcmp, T(20538, TimeUtil.FormatEnTime(endDiff)), "TimeTxt")
                else
                  refresh = true
                end
              end
              if refresh and not event.wait then
                event.wait = true
                GuildWarService.GetGuildWarScheduleReq(function()
                  event.wait = false
                end)
              end
            else
              ChangeUIController(gobj, "c2", 0)
              ChangeUIController(gobj, "c4", 1)
              local tipsWord = gobj:GetChild("MapBuildWord")
              UIUtil.SetText(tipsWord, T(20539), "WordTxt")
            end
          end
        else
          ChangeUIController(gobj, "c2", 0)
        end
        local funcId
        if e_type == AbyssExploreEventID.BUILDING then
          funcId = FEATURE_ENUM.TIDE_DUNGEON
        elseif e_type == AbyssExploreEventID.EXPEDITION_BUILDING then
          funcId = FEATURE_ENUM.ADVENTURE_DREAMLAND
        elseif e_type == AbyssExploreEventID.CHALLENGE_BOSS then
          funcId = FEATURE_ENUM.ADVENTURE_BOSS
        elseif e_type == AbyssExploreEventID.FROST_DUNGEON then
          funcId = FEATURE_ENUM.FROST_DUNGEON
        elseif e_type == AbyssExploreEventID.ROGUELIKE then
          funcId = FEATURE_ENUM.ADVENTURE_ROGUE
        elseif e_type == AbyssExploreEventID.GUILD_WAR_ENTRANCE then
          funcId = FEATURE_ENUM.HOME_GUILD_WAR
        end
        if funcId then
          local unlock = EnterClampUtil.WhetherToEnter(funcId, false)
          ChangeUIController(gobj, "c3", unlock and 0 or 1)
          if not unlock then
            local lock = gobj:GetChild("MapBuildLock")
            local conf = TableData.GetConfig(funcId, "BaseFeature")
            UIUtil.SetText(lock, type(conf.unlock_des) == "function" and conf.unlock_des() or "未配置解锁提示", "WordTxt")
          end
          local time = gobj:GetChild("MapBuildTime")
          local tipsWord = gobj:GetChild("MapBuildWord")
          if e_type == AbyssExploreEventID.CHALLENGE_BOSS then
            ChangeUIController(gobj, "c4", unlock and 1 or 0)
            UIUtil.SetText(tipsWord, T(20501), "WordTxt")
          end
          time.visible = unlock
          tipsWord.visible = unlock
        else
          ChangeUIController(gobj, "c3", 0)
        end
        if AbyssExploreMgr.RegionIsUnlock(cursor.regionId) then
          gobj.visible = true
          local worldPos = cursor.position + cursorPositionOffset
          local screenPos = AbyssExploreMgr.WorldToScreenPoint(worldPos)
          local position = cursorParent:RootToLocal(screenPos)
          gobj:SetXY(position.x, position.y)
        else
          gobj.visible = false
        end
      end
    end
  end
end
local UpdateGridEventOverlaps = function()
  if eventOverlapsCollection then
    for k, v in pairs(eventOverlapsCollection) do
      local got, grid = AbyssExploreMapCtrl.GetMapLogicInst():TryGetGrid(k)
      if got then
        local screenPos = AbyssExploreMgr.WorldToScreenPoint(grid.center)
        local position = cursorRoot:RootToLocal(screenPos)
        v:SetXY(position.x, position.y)
      end
    end
  end
end
local OnCameraPositionChanged = function(camPosition)
  UpdateEventTipsPosition()
  UpdateCursors()
  UpdateGridEventOverlaps()
end
local RegisterListeners = function()
  AbyssExploreMgr.AddListener(AbyssExploreMsgEnum.EVENT_CREATE, OnEventCreate)
  AbyssExploreMgr.AddListener(AbyssExploreMsgEnum.EVENT_DELETE, OnEventDelete)
  AbyssExploreMgr.AddListener(AbyssExploreMsgEnum.EVENT_RES_LOADED, OnEventResLoaded)
  AbyssExploreMgr.AddListener(AbyssExploreMsgEnum.EVENT_OVERLAP, OnEventOverlap)
  AbyssExploreMgr.AddListener(AbyssExploreMsgEnum.EVENT_BRANCH_PATH_INFO, RefreshBranchesPathInfo)
  AbyssExploreMgr.AddListener(AbyssExploreMsgEnum.POPUP_EVENT_TIPS, OnPopupEventTips)
  AbyssExploreMgr.AddListener(AbyssExploreMsgEnum.CHA_START_MOVING, OnChrStartMoving)
  AbyssExploreMgr.AddListener(AbyssExploreMsgEnum.CAMERA_POSITION_CHANGED, OnCameraPositionChanged)
end
local UnregisterListeners = function()
  AbyssExploreMgr.RemoveListener(AbyssExploreMsgEnum.EVENT_CREATE, OnEventCreate)
  AbyssExploreMgr.RemoveListener(AbyssExploreMsgEnum.EVENT_DELETE, OnEventDelete)
  AbyssExploreMgr.RemoveListener(AbyssExploreMsgEnum.EVENT_RES_LOADED, OnEventResLoaded)
  AbyssExploreMgr.RemoveListener(AbyssExploreMsgEnum.EVENT_OVERLAP, OnEventOverlap)
  AbyssExploreMgr.RemoveListener(AbyssExploreMsgEnum.EVENT_BRANCH_PATH_INFO, RefreshBranchesPathInfo)
  AbyssExploreMgr.RemoveListener(AbyssExploreMsgEnum.POPUP_EVENT_TIPS, OnPopupEventTips)
  AbyssExploreMgr.RemoveListener(AbyssExploreMsgEnum.CHA_START_MOVING, OnChrStartMoving)
  AbyssExploreMgr.RemoveListener(AbyssExploreMsgEnum.CAMERA_POSITION_CHANGED, OnCameraPositionChanged)
end
local BadgeBtnUnlockCallback = function(isUnlock)
  ChangeUIController(uis.Main.BadgeBtn, "lock", isUnlock and 0 or 1)
end
local StoryBtnUnlockCallback = function(isUnlock)
  ChangeUIController(uis.Main.StoryBtn, "lock", isUnlock and 0 or 1)
end
local FuncIsUnlock = function(funcId, tips)
  local index = -1
  local unlock = EnterClampUtil.WhetherToEnter(funcId, tips)
  if unlock then
    local conf = TableData.GetConfig(funcId, "BaseFeature")
    local eventId = conf.eventId
    if type(eventId) == "number" then
      unlock = AbyssExploreMgr.IsFinished(eventId)
      if not unlock and tips then
        FloatTipsUtil.ShowWarnTips("完成指定事件后解锁！！！")
      end
    end
  end
  if unlock then
    for i, v in pairs(unlockedFunctions) do
      if v.id == funcId then
        index = i
        break
      end
    end
  end
  return unlock, index
end
local RefreshFuncList = function(functions)
  local list = uis.Main.RightRegionList
  list:RemoveChildrenToPool()
  
  function list.itemProvider(i)
    return functions[i + 1].btnURL
  end
  
  function list.itemRenderer(i, gobj)
    local item = functions[i + 1]
    if item.id == FEATURE_ENUM.ABYSS_FUNC_INDEX then
      local new = RedDotAbyss.HasNewFunction()
      ChangeUIController(gobj, "abyss", new and 1 or 0)
      UIUtil.SetText(gobj:GetChild("AbyssSign"), T(20251), "WordTxt")
    end
    UIUtil.SetText(gobj, item.btnTitle)
    UIUtil.SetText(gobj, item.btnSubtitle, "SubtitleTxt")
    local unlock = FuncIsUnlock(item.id, false)
    ChangeUIController(gobj, "lock", unlock and 0 or 1)
    gobj.onClick:Set(function()
      if FuncIsUnlock(item.id, true) then
        item.btnOnClick()
      end
    end)
  end
  
  local numItems = #functions
  list.numItems = numItems
  local width = 0
  for i = 1, numItems do
    width = width + list:GetChildAt(i - 1).width
  end
  list.width = width + (numItems - 1) * list.columnGap
end
local RefreshRedDotData = function()
  RedDotMgr.RemoveNode(WinResConfig.AbyssWindow.name)
  RedDotAbyss.Init()
  RedDotMgr.AddNode({
    windowName = WinResConfig.AbyssWindow.name,
    com = uis.Main.MemberBtn,
    visibleFunc = function()
      return RedDotCard.CanAnyCardGrowUp()
    end,
    dataType = RED_DOT_DATA_TYPE.CARD
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.AbyssWindow.name,
    com = uis.Main.DailyTaskBtn,
    visibleFunc = function()
      return RedDotTask.HomeTaskRed()
    end,
    dataType = RED_DOT_DATA_TYPE.TASK
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.AbyssWindow.name,
    com = uis.Main.BadgeBtn,
    visibleFunc = function()
      return RedDotBadge.CanShowHome()
    end,
    dataType = RED_DOT_DATA_TYPE.BADGE,
    homeLimitSort = GetHomeRedDotSort(FEATURE_ENUM.BADGE)
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.AbyssWindow.name,
    com = uis.Main.StoryBtn,
    visibleFunc = function()
      return RedDotStory.HomeTaskRed()
    end,
    dataType = RED_DOT_DATA_TYPE.STORY
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.AbyssWindow.name,
    com = uis.Main.AbyssNewPeopleBtn,
    visibleFunc = function()
      local manorInfo = AbyssExploreData.GetManorInfo()
      return manorInfo.rookieFinished and not manorInfo.rookieReward
    end,
    dataType = RED_DOT_DATA_TYPE.ABYSS
  })
  local unlock, index = FuncIsUnlock(FEATURE_ENUM.ABYSS_SHOP, false)
  if unlock and index > 0 then
    local list = uis.Main.RightRegionList
    RedDotMgr.AddNode({
      windowName = WinResConfig.AbyssWindow.name,
      com = list:GetChildAt(index - 1),
      visibleFunc = function()
        return RedDotAbyss.HasNewGoods()
      end,
      dataType = RED_DOT_DATA_TYPE.ABYSS
    })
  end
  unlock, index = FuncIsUnlock(FEATURE_ENUM.ABYSS_FUNC_INDEX, false)
  if unlock and index > 0 then
    local list = uis.Main.RightRegionList
    RedDotMgr.AddNode({
      windowName = WinResConfig.AbyssWindow.name,
      com = list:GetChildAt(index - 1),
      visibleFunc = function()
        local visible = false
        if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.TIDE_DUNGEON, false) and not visible then
          visible = RedDotAbyss.TideDungeonHasAnyRewards()
        end
        if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_ROGUE, false) then
          local info = RogueData.GetRogueInfo()
          visible = not info or visible or RedDotRogue.CanTaskReward() or RedDotRogue.CanLevelReward()
        end
        return visible or RedDotAbyss.HasNewTreasures()
      end,
      newFlagVisibleFunc = function()
        return RedDotAbyss.HasNewFunction()
      end,
      newFlagName = "abyss",
      onlyNew = true,
      dataType = RED_DOT_DATA_TYPE.ABYSS
    })
  end
  RedDotMgr.UpdateNodeByWindowName(WinResConfig.AbyssWindow.name)
end
local funcCompare = function(x, y)
  return x.sort < y.sort
end
local FuncBtnUnlockCallback = function(funcId, isUnlock)
  local exists = false
  for i, v in ipairs(unlockedFunctions) do
    if v.id == funcId then
      exists = i
      break
    end
  end
  if exists then
    local list = uis.Main.RightRegionList
    local btn = list:GetChildAt(exists - 1)
    ChangeUIController(btn, "lock", isUnlock and 0 or 1)
  elseif isUnlock then
    table.insert(unlockedFunctions, FuncList[funcId])
    table.sort(unlockedFunctions, funcCompare)
    RefreshFuncList(unlockedFunctions)
    RefreshRedDotData()
  end
end
local ShopBtnUnlockCallback = function(isUnlock)
  FuncBtnUnlockCallback(FEATURE_ENUM.ABYSS_SHOP, isUnlock)
end
local RefreshPlayerAttributes = function()
  local max = TableData.GetConfig(70010802, "BaseFixed").int_value
  uis.Main.SmallMapRegion.ActionValue.NumberTxt.text = string.format("[color=#e6ff51]%s[/color]/%s", ActorData.GetItemCount(COMMON_ITEM_ID.ABYSS_ACTION_POINT), max)
  local list = uis.Main.RightRegionList
  local exists = false
  for i, v in ipairs(unlockedFunctions) do
    if v.id == FEATURE_ENUM.ABYSS_CHA_PLOT then
      exists = i
      break
    end
  end
  if exists then
    local cardPlotBtn = list:GetChildAt(exists - 1)
    local cnt = ActorData.GetItemCount(COMMON_ITEM_ID.ABYSS_PLOT_POINT)
    local max = TableData.GetConfig(70010807, "BaseFixed").int_value
    local content = string.format("[color=#e6ff51]%s[/color]/%s", cnt, max)
    UIUtil.SetText(cardPlotBtn, content, "NumberTxt")
  end
end
local PlotBtnUnlockCallback = function(isUnlock)
  FuncBtnUnlockCallback(FEATURE_ENUM.ABYSS_CHA_PLOT, isUnlock)
  if isUnlock then
    RefreshPlayerAttributes()
  end
end
local FuncIndexBtnUnlockCallback = function(isUnlock)
  FuncBtnUnlockCallback(FEATURE_ENUM.ABYSS_FUNC_INDEX, isUnlock)
end
local UpdateFuncBtnState = function(funcId, callback)
  if type(callback) == "function" then
    callback(FuncIsUnlock(funcId, false))
  end
end
local UpdateEntranceState = function(deltaTime)
  EnterClampUtil.UpdateEntranceState(FEATURE_ENUM.HOME_BADGE, BadgeBtnUnlockCallback)
  EnterClampUtil.UpdateEntranceState(FEATURE_ENUM.HOME_STORY, StoryBtnUnlockCallback)
  UpdateFuncBtnState(FEATURE_ENUM.ABYSS_SHOP, ShopBtnUnlockCallback)
  UpdateFuncBtnState(FEATURE_ENUM.ABYSS_CHA_PLOT, PlotBtnUnlockCallback)
  UpdateFuncBtnState(FEATURE_ENUM.ABYSS_FUNC_INDEX, FuncIndexBtnUnlockCallback)
end
local updateTimeTimer = 0
local UpdateTime = function(deltaTime)
  updateTimeTimer = updateTimeTimer + deltaTime
  if updateTimeTimer > 60 then
    local playerInfo = uis.Main.PlayerInfo
    playerInfo.TimeTxt.text = TimeUtil.FormatDate("%H:%M", LoginData.GetCurServerTime())
  end
end
local UpdateBatteryLevel = function()
  if uis then
    local playerInfo = uis.Main.PlayerInfo
    playerInfo.BatteryProgressBar.value = SystemInfo.batteryLevel * 100
  end
end
local ResidentEventPositionLookup = {
  [76201202] = Vector3(1016.33002, 992.52002, 0),
  [76203010] = Vector3(1023.34003, 1001.53998, 0),
  [76201205] = Vector3(1024.45996, 1007.97998, 0),
  [76204010] = Vector3(1019.5, 1007.53003, 0),
  [76201101] = Vector3(1007.11902, 1001.41199, 0),
  [76201201] = Vector3(978.130005, 1003.47998, 0),
  [76202010] = Vector3(987.119995, 1003.42999, 0),
  [76201022] = Vector3(995.767029, 999.4, 0),
  [76201102] = Vector3(996.330017, 1016.5, 0)
}
local RefreshEventDisplayInfo = function()
  for _, v in ipairs(mapflags) do
    softMask:RemoveGObject(v.gobj)
    v:delete()
  end
  table.clear(mapflags)
  for _, v in ipairs(cursors) do
    v.gobj:Dispose()
  end
  table.clear(cursors)
  local sub = minimap:GetChild("BigMapPic")
  local flagparent = minimap:GetChild("BigMapEventPic")
  local mapObj = sub:GetChild("BigMapPic1")
  local events = AbyssExploreData.GetAllEvents()
  for i, v in pairs(events) do
    local type = v.type
    local resident = type == AbyssExploreEventID.BUILDING or type == AbyssExploreEventID.CHALLENGE_BOSS or type == AbyssExploreEventID.EXPEDITION_BUILDING or type == AbyssExploreEventID.FROST_DUNGEON or type == AbyssExploreEventID.ROGUELIKE or type == AbyssExploreEventID.GUILD_WAR_ENTRANCE or type == AbyssExploreEventID.PORTAL and 0 == v.finishTimestamp
    local regionId = not v.noPosition and AbyssExploreMgr.GetRegionId(v.x, v.y)
    local inserted = AbyssExploreMapCtrl.EventIsInserted(v)
    if not v.noPosition and (0 == v.finishTimestamp or resident) and AbyssExploreMgr.RegionIsUnlock(regionId) and not AbyssExploreMgr.RegionIsCleared(regionId) and inserted then
      local inst = AbyssExploreMapflag.CreateMapflagWithEventInfo(v, flagparent, mapObj, Vector2(0.5, 0.5), true, flagscale)
      if inst then
        inst:marker(AbyssExploreMgr.IsFocusing(v.eventId))
        inst.gobj:GetChild("EventChoice").visible = false
        table.insert(mapflags, inst)
      end
      DisplayGridEventOverlapsIfNecessary_Event(v)
    end
    if resident then
      local gobj
      if v.eventId == 76201022 then
        gobj = UIMgr:CreateObject("Abyss", "NoviceMoveTips")
        UIUtil.SetText(gobj, T(20365), "WordTxt")
      else
        gobj = UIMgr:CreateObject("Abyss", "MapBuildSign")
      end
      gobj.touchable = false
      local position = ResidentEventPositionLookup[v.eventId] or AbyssExploreMapCtrl.GridToWorld(v.location.x, v.location.y)
      local cursor = {
        eventId = v.eventId,
        gobj = gobj,
        position = position,
        regionId = regionId
      }
      local ctrl_index = 0
      if type == AbyssExploreEventID.BUILDING or type == AbyssExploreEventID.FROST_DUNGEON then
        ctrl_index = 0
      elseif type == AbyssExploreEventID.CHALLENGE_BOSS then
        ctrl_index = 1
      elseif type == AbyssExploreEventID.ROGUELIKE then
        ctrl_index = 2
      elseif type == AbyssExploreEventID.GUILD_WAR_ENTRANCE then
        ctrl_index = 4
      end
      ChangeUIController(gobj, "c1", ctrl_index)
      cursorRoot:AddChild(gobj)
      table.insert(cursors, cursor)
    end
  end
  softMask:MaskGObject(minimap)
end
local RefreshPanelInfo = function()
  local manorInfo = AbyssExploreData.GetManorInfo()
  local rewarded = manorInfo.rookieReward
  if rewarded then
    ChangeUIController(uis.Main.root, "newpeople", 0)
  else
    ChangeUIController(uis.Main.root, "newpeople", 1)
  end
end
local UpdateMinimap = function()
  local sub = minimap:GetChild("BigMapPic")
  local gobj = sub:GetChild("BigMapPic1")
  local mapcamInst = AbyssExploreCamCtrl.GetMapcamInst()
  local position = mapcamInst:GetViewBounds().center
  local parent = uis.Main.SmallMapRegion.SmallMap.SmallMapPic.root
  local halfW, halfH = parent.width * 0.5, parent.height * 0.5
  local point = AbyssExploreMinimapUtils.WorldPositionToMinimap(position, gobj)
  point = gobj:TransformPoint(point, minimap)
  minimap.pivotAsAnchor = true
  minimap.pivot = Vector2(point.x / minimap.width, point.y / minimap.height)
  minimap:SetXY(halfW, halfH)
  position = AbyssExploreChrCtrl.GetPosition()
  local x, y = AbyssExploreMinimapUtils.WorldPositionToMapRatio(position)
  playerflag:setpos(x, y)
  for i, flag in ipairs(mapflags) do
    local eventInfo = flag.userdata
    local x, y = eventInfo.x, eventInfo.y
    local location = eventInfo.location
    if location then
      x, y = location.x, location.y
    end
    if eventInfo and AbyssExploreMgr.GridIsUnlock(x, y) then
      flag:setactive(true)
    else
      flag:setactive(false)
    end
  end
end
local OnUpdate = function()
  if not AbyssExploreMgr.Exists() then
    return
  end
  local deltaTime = Time.deltaTime
  UpdateTime(deltaTime)
  UpdateEntranceState(deltaTime)
  if not AbyssExploreCamCtrl.IsSwiping() then
    UpdateEventTipsPosition()
    UpdateGridEventOverlaps()
  end
  RefreshPanelInfo()
end
local OnLateUpdate = function()
  if not AbyssExploreMgr.Exists() then
    return
  end
  UpdateMinimap()
  if not AbyssExploreCamCtrl.IsSwiping() then
    UpdateCursors()
  end
end

function AbyssWindow.ReInitData()
end

function AbyssWindow.OnInit(bridgeObj)
  bridgeObj:SetView(WinResConfig.AbyssWindow.package, WinResConfig.AbyssWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetAbyss_AbyssWindowUis(contentPane)
    uis.root.opaque = false
    uis.Main.root.opaque = false
    uis.Main.SmallMapRegion.root.opaque = false
    uis.Main.SmallMapRegion.SmallMap.root.opaque = false
    AbyssWindow.UpdateInfo()
    AbyssWindow.InitBtn()
    RegisterListeners()
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.COLLECT_EVENTS)
    SoundUtil.PlayMusic(30007)
  end)
end

local SetCompsVisible = function(visible)
  local main = uis.Main
  main.PlayerInfo.root.visible = visible
  main.TaskList.visible = visible
  main.SmallMapRegion.root.visible = visible
  main.BadgeBtn.visible = visible
  main.StoryBtn.visible = visible
  main.MemberBtn.visible = visible
  main.ReturnBtn.visible = visible
  main.DailyTaskBtn.visible = visible
  main.ExplainBtn.visible = visible
  main.CardSwitchBtn.visible = visible
  main.RightRegionList.visible = visible
  eventTipsVisible = visible
  AbyssEventList.SetVisible(visible)
  if eventTipsRoot then
    eventTipsRoot.visible = eventTipsVisible
  end
end
local CHRStopMove = function()
  AbyssExploreChrCtrl.StopMovingAfter(1)
end
local InitFuncList = function()
  unlockedFunctions = {}
  for funcId, v in pairs(FuncList) do
    if FuncIsUnlock(v.id, false) then
      table.insert(unlockedFunctions, v)
    else
      local conf = TableData.GetConfig(funcId, "BaseFeature")
      if type(conf.show_type) ~= "number" or 1 ~= conf.show_type then
        table.insert(unlockedFunctions, v)
      end
    end
  end
  table.sort(unlockedFunctions, funcCompare)
  RefreshFuncList(unlockedFunctions)
end
local enterActivityId, enterActivityIndex
local GetTaskInfo = function()
  local func = function(taskInfo)
    if taskInfo then
      if taskInfo.value >= taskInfo.targetValue then
        return taskInfo, false
      end
      return taskInfo, true
    else
      return nil, true
    end
  end
  enterActivityId = nil
  local taskInfo, finished = func(DailyTaskData.GetHomeShowTask())
  local carnivalTaskInfo, biographyTaskInfo
  if finished then
    local taskInfoTarget = DailyTaskData.ShowHomeDailyTarget()
    if taskInfoTarget then
      enterActivityId = ACTIVITY_ID.DAILY_TASK
      return taskInfoTarget
    end
    local lvGift = CarnivalData.ShowHomeLvGift()
    if lvGift then
      enterActivityId = ACTIVITY_ID.LV_GIFT
      return lvGift
    end
    carnivalTaskInfo, finished = func(CarnivalData.GetHomeShowTask())
    if finished then
      local carnivalTaskInfoTarget = CarnivalData.ShowHomeCarnivalTarget()
      if carnivalTaskInfoTarget then
        enterActivityId = ACTIVITY_ID.CARNIVAL
        return carnivalTaskInfoTarget
      end
      local signInfo = CarnivalData.SignIsShowHome()
      if signInfo then
        enterActivityId = ACTIVITY_ID.INITIAL_SIGN
        return signInfo
      end
      biographyTaskInfo, finished = func(BiographyData.GetHomeShowTask())
      if false == finished then
        enterActivityId = ACTIVITY_ID.BIOGRAPHY
        return biographyTaskInfo
      end
      biographyTaskInfo = CarnivalData.BiographyShowHome()
      if biographyTaskInfo then
        enterActivityId = ACTIVITY_ID.BIOGRAPHY
        return biographyTaskInfo
      end
      local dailySupply = DailySupplyMgr.HasAnyInTimeSupply()
      if dailySupply then
        enterActivityId = ACTIVITY_ID.DAILY_SUPPLY
        local conf = TableData.GetConfig(ACTIVITY_ID.DAILY_SUPPLY, "BaseActivity")
        return {
          url = UIUtil.GetResUrl(conf.home_icon),
          text = T(80629606, DailySupplyMgr.GetTotalSupplies())
        }
      end
      if nil ~= taskInfo then
        enterActivityId = ACTIVITY_ID.DAILY_TASK
        return taskInfo
      end
      if nil ~= carnivalTaskInfo then
        enterActivityId = ACTIVITY_ID.CARNIVAL
        return carnivalTaskInfo
      end
      if nil ~= biographyTaskInfo then
        enterActivityId = ACTIVITY_ID.BIOGRAPHY
        return biographyTaskInfo
      end
    else
      enterActivityId = ACTIVITY_ID.CARNIVAL
      return carnivalTaskInfo
    end
  else
    enterActivityId = ACTIVITY_ID.DAILY_TASK
    return taskInfo
  end
end
local UpdateTaskInfo = function()
  local taskInfo = GetTaskInfo()
  enterActivityIndex = taskInfo and taskInfo.tabIndex or nil
end

function AbyssWindow.UpdateInfo()
  InitFuncList()
  tipsVersion = 0
  minimap = UIMgr:CreateObject("Abyss", "BigMapPicDrag")
  local map_pic = minimap:GetChild("BigMapPic"):GetChild("BigMapPic1")
  local pic_width, pic_height = map_pic.width, map_pic.height
  local view_scale = 1
  local bounds = AbyssExploreCamCtrl.GetMapcamInst():GetViewBounds()
  local ratio = bounds.size.x / AbyssExploreSettings.Map.size.x
  local ui_view_width = uis.Main.SmallMapRegion.SmallMap.SmallMapPic.MapLoader.width
  local scale = ratio * view_scale / (ui_view_width / pic_width)
  minimap:SetSize(minimap.initWidth / scale, minimap.initHeight / scale)
  for i = 1, 8 do
    local child = minimap:GetChild(string.format("Area%s", i))
    local title = child:GetChild("AreaTitle")
    title.visible = false
    local unlock = AbyssExploreMgr.RegionIsUnlock(i)
    local cleared = AbyssExploreMgr.RegionIsCleared(i)
    local available = unlock and not cleared
    local cnt = child.numChildren
    if 1 == i then
      ChangeUIController(child, "lock", available and 0 or 1)
    end
    if cnt > 1 then
      for j = 0, cnt - 1 do
        local c = child:GetChildAt(j)
        if string.find(c.name, "n") then
          c.visible = not unlock or cleared
        end
      end
    end
  end
  cursors = {}
  mapflags = {}
  local sub = minimap:GetChild("BigMapPic")
  local flagparent = minimap:GetChild("BigMapEventPic")
  local mapObj = sub:GetChild("BigMapPic1")
  local inverse = Vector2.one / scale
  local eventScale = inverse * 1.3
  local playerScale = inverse * 1.3
  local maskParent = uis.Main.SmallMapRegion.SmallMap.root
  local go = GameObject("SOFT_MASK")
  go.layer = 5
  softMask = go:AddComponent(typeof(CS.SoftMask))
  softMask.cachedTransform:SetParent(maskParent.displayObject.cachedTransform)
  local mask = maskParent:GetChild("n3")
  local mask_scale = 1.025
  local width, height = mask.size.x * mask_scale, mask.size.y * mask_scale
  local parentSize = maskParent.size
  local pivot = Vector2(0.5, 0.5)
  softMask.cachedTransform.localScale = Vector3.one
  softMask.cachedTransform.localPosition = Vector3((parentSize.x - width) * 0.5 + pivot.x * width, -((parentSize.y - height) * 0.5 + pivot.y * height), 0)
  softMask:SetMaskRect(width, height, pivot)
  cursorRoot = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Component)
  uis.Main.root:AddChildAt(cursorRoot, 0)
  flagscale = eventScale
  RefreshEventDisplayInfo()
  local parent = uis.Main.SmallMapRegion.SmallMap.SmallMapPic.root
  parent:AddChild(minimap)
  local fogHolder = sub:GetChild("FogHolder")
  fogHolder.touchable = false
  local playerInfo = uis.Main.PlayerInfo
  playerInfo.IdNumberTxt.text = T(1, tostring(ActorData.GetUin()))
  playerInfo.PlayerNameTxt.text = ActorData.GetName()
  playerInfo.TimeTxt.text = TimeUtil.FormatDate("%H:%M", LoginData.GetCurServerTime())
  UpdateBatteryLevel()
  local loginDays = ActorData.GetLoginDays()
  if loginDays <= 365 then
    playerInfo.Day.c1Ctr.selectedIndex = 0
    playerInfo.Day.Day1Txt.text = loginDays
    playerInfo.Day.UnitTxt.text = T(299)
  else
    playerInfo.Day.c1Ctr.selectedIndex = 1
    playerInfo.Day.Day1Txt.text = string.format("%.1f", loginDays / 365)
    playerInfo.Day.Day2Txt.text = T(345, loginDays)
    playerInfo.Day.UnitTxt.text = T(10154)
  end
  RefreshPlayerAttributes()
  UIUtil.SetBtnText(uis.Main.MemberBtn, T(7), T(10167))
  UIUtil.SetBtnText(uis.Main.BadgeBtn, T(8), T(10168))
  UIUtil.SetBtnText(uis.Main.DailyTaskBtn, T(20009))
  UIUtil.SetBtnText(uis.Main.ReturnBtn, T(20077))
  UIUtil.SetBtnText(uis.Main.StoryBtn, T(6), T(10166))
  activitiesCache = AbyssExploreData.GetActivities()
  branchesCache = AbyssExploreData.GetProcessingBranchEvents()
  focusCache = AbyssExploreData.GetFocusEvents()
  RefreshTaskList()
  UpdateEntranceState()
  playerflag = AbyssExploreMapflag.CreateMapflag(flagparent, mapObj, AbyssExploreChrCtrl.GetPosition(), Vector2(0.5, 1), true, playerScale)
  softMask:MaskGObject(playerflag.gobj)
  UpdateTaskInfo()
  RefreshRedDotData()
  RefreshPanelInfo()
end

local actValTipsTimer
local actValUpdateIntvl, actValTipsDuration = 0.25, 2.5

function AbyssWindow.InitBtn()
  local main = uis.Main
  main.ReturnBtn.onClick:Set(function()
    if busy or not AbyssExploreMgr.IsGesturable() then
      return
    end
    AbyssExploreMgr.Release()
    enablePopupEventTips = false
    UIMgr:CloseToWindow(WinResConfig.HomeWindow.name)
  end)
  main.MemberBtn.onClick:Set(function()
    if busy or not AbyssExploreMgr.IsGesturable() then
      return
    end
    busy = true
    AbyssEventList.SetBusy(busy)
    AbyssExploreMgr.PauseUpdate(true)
    CHRStopMove()
    OpenWindow(WinResConfig.CardListWindow.name)
  end)
  main.BadgeBtn.onClick:Set(function()
    if busy or not AbyssExploreMgr.IsGesturable() then
      return
    end
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_BADGE) then
      busy = true
      CHRStopMove()
      AbyssEventList.SetBusy(busy)
      AbyssExploreMgr.PauseUpdate(true)
      ld("Badge", function()
        OpenWindow(WinResConfig.BadgeWindow.name)
      end)
    end
  end)
  main.DailyTaskBtn.onClick:Set(function()
    if busy or not AbyssExploreMgr.IsGesturable() then
      return
    end
    busy = true
    AbyssEventList.SetBusy(busy)
    AbyssExploreMgr.PauseUpdate(true)
    CHRStopMove()
    OpenWindow(WinResConfig.CarnivalWindow.name, nil, enterActivityId, enterActivityIndex)
  end)
  main.ExplainBtn.onClick:Set(function()
    local conf = TableData.GetConfig(FEATURE_ENUM.HOME_EXPLORE, "BaseFeature")
    local captionId = conf.caption_id
    WindowLoadPackages[WinResConfig.GuidePicLookWindow.name] = {
      "Guide_" .. Language.curLanguage
    }
    conf = TableData.GetConfig(captionId, "BaseGuideCaption")
    local picture, add, eventId = conf.picture, conf.add, conf.eventId
    local finished = AbyssExploreMgr.IsFinished(eventId)
    if type(eventId) == "number" and picture and add then
      for _, v in ipairs(add) do
        local _, i = table.contain(picture, v)
        if type(i) == "number" then
          if not finished then
            table.remove(picture, i)
          end
        elseif finished then
          table.insert(picture, v)
        end
      end
    end
    OpenWindow(WinResConfig.GuidePicLookWindow.name, nil, captionId, nil, true)
  end)
  main.CardSwitchBtn.onClick:Set(function()
    if busy then
      return
    end
    CHRStopMove()
    OpenWindow(WinResConfig.QBSwitchWindow.name)
  end)
  main.PositionBtn.onClick:Set(function()
    if busy then
      return
    end
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.RESET_CAMERA)
  end)
  main.StoryBtn.onClick:Set(function()
    if BlockInTestPackage() then
      return
    end
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_STORY) then
      CHRStopMove()
      ActorService.GetStoryListReq(0)
      ld("Story", function()
        StoryService.GetStoryMonsterListReq(function()
          OpenWindow(WinResConfig.StoryWindow.name)
        end)
      end)
    end
  end)
  local minimapRegion = main.SmallMapRegion
  minimapRegion.SmallMap.root.onClick:Add(function()
    if busy then
      return
    end
    CHRStopMove()
    OpenWindow(WinResConfig.AbyssBigMapWindow.name)
  end)
  local ctr = minimapRegion.c1Ctr
  minimapRegion.ActionValue.root.onClick:Set(function()
    ctr.selectedIndex = 1
  end)
  local tips = minimapRegion.ActionValueTips
  local Format_HH_MM_SS = function(timestamp)
    local hours, minutes, seconds
    hours = math.floor(timestamp / 3600)
    timestamp = timestamp % 3600
    minutes = math.floor(timestamp / 60)
    seconds = math.floor(timestamp % 60)
    return string.format("%02d:%02d:%02d", hours, minutes, seconds)
  end
  local UpdateRecoverTime = function()
    local timestamp = AbyssExploreData.GetActionValueRecoverTimestamp()
    local diff = math.max(0, timestamp - LoginData.GetCurServerTime())
    local time = math.floor(diff)
    local hours, minutes, seconds
    hours = math.floor(time / 3600)
    time = time % 3600
    minutes = math.floor(time / 60)
    seconds = time % 60
    local totalTimeContent = T(20200, Format_HH_MM_SS(diff))
    local intvl = TableData.GetConfig(70010801, "BaseFixed").int_value
    local mod = diff % intvl
    local nextTimeContent = T(20201, Format_HH_MM_SS(mod))
    tips.AllTimeTxt.text = totalTimeContent
    tips.NextTimeTxt.text = nextTimeContent
  end
  minimapRegion.c1Ctr.onChanged:Set(function()
    if 1 == ctr.selectedIndex then
      UpdateRecoverTime()
      if actValTipsTimer then
        actValTipsTimer:stop()
      end
      actValTipsTimer = TimerUtil.new(actValUpdateIntvl, actValTipsDuration / actValUpdateIntvl, UpdateRecoverTime, function()
        ctr.selectedIndex = 0
      end)
      actValTipsTimer:start()
    else
      if actValTipsTimer then
        actValTipsTimer:stop()
      end
      actValTipsTimer = nil
    end
  end)
  minimapRegion.CloseTipsBtn.onClick:Set(function()
    ctr.selectedIndex = 0
  end)
  local display = not AbyssExploreMgr.RegionIsCleared(1) and (EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_DREAMLAND, false) or EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_BOSS, false) or EnterClampUtil.WhetherToEnter(FEATURE_ENUM.TIDE_DUNGEON, false))
  main.FunctionOpenBtn.visible = display
  main.FunctionOpenBtn.onClick:Set(function()
    OpenWindow(WinResConfig.AbyssTipsWindow.name, UILayer.Guide, true)
  end)
  main.AbyssNewPeopleBtn.onClick:Set(function()
    OpenWindow(WinResConfig.AbyssRewardWindow.name)
  end)
end

local show = false

function AbyssWindow.OnShown()
  AbyssExploreMgr.PauseUpdate(false)
  AbyssExploreMgr.SetActive(true)
  if not show then
    AbyssExploreMgr.EnableGestureOp(true)
    RedDotMgr.UpdateNodeByWindowName(WinResConfig.AbyssWindow.name)
  end
  show = true
  UpdateManager.AddUpdateHandler(OnUpdate)
  UpdateManager.AddLateUpdateHandler(OnLateUpdate)
  AbyssExploreMapCtrl.EnableSearchPath(true)
  busy = false
  AbyssEventList.SetBusy(false)
  if uis then
    UpdateTaskInfo()
    SetCompsVisible(true)
    RefreshFuncList(unlockedFunctions)
    contentPane.alpha = 0
    uis.Main.root.touchable = false
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.COLLECT_EVENTS)
    LeanTween.value(contentPane.displayObject.gameObject, 0, 1, 0.3):setEaseInQuad():setOnUpdate(function(val)
      contentPane.alpha = val
    end):setOnComplete(function()
      uis.Main.root.touchable = true
    end):setIgnoreTimeScale(true)
  end
end

function AbyssWindow.OnHide()
  if show then
    AbyssExploreMgr.EnableGestureOp(false)
  end
  show = false
  UpdateManager.RemoveUpdateHandler(OnUpdate)
  UpdateManager.RemoveLateUpdateHandler(OnLateUpdate)
end

function AbyssWindow.OnClose()
  UpdateManager.RemoveUpdateHandler(OnUpdate)
  UpdateManager.RemoveLateUpdateHandler(OnLateUpdate)
  RedDotMgr.RemoveNode(WinResConfig.AbyssWindow.name)
  AbyssExploreMgr.SetActive(false)
  if contentPane then
    LeanTween.cancel(contentPane.displayObject.gameObject)
  end
  UnregisterListeners()
  uis = nil
  contentPane = nil
  if minimap then
    minimap:Dispose()
  end
  minimap = nil
  fowMask = nil
  softMask = nil
  if playerflag then
    playerflag:delete()
  end
  playerflag = nil
  if mapflags then
    for i, v in ipairs(mapflags) do
      v:delete()
    end
  end
  mapflags = nil
  if cursors then
    for i, v in ipairs(cursors) do
      v.gobj:Dispose()
      v.gobj = nil
    end
  end
  cursors = nil
  if cursorRoot then
    cursorRoot:Dispose()
  end
  cursorRoot = nil
  if eventTipsRoot then
    local list = eventTipsRoot:GetChild("EventTipsList")
    local numChildren = list.numChildren
    for j = 1, numChildren do
      local childIndex = j - 1
      local child = list:GetChildAt(childIndex)
      if IsUITransPlaying(child, "out") then
        PlayUITransToComplete(child, "out")
      end
    end
    eventTipsRoot:Dispose()
  end
  eventTipsRoot = nil
  eventsBuffer = nil
  if actValTipsTimer then
    actValTipsTimer:stop()
  end
  actValTipsTimer = nil
  unlockedFunctions = nil
  if eventOverlapsCollection then
    for i, v in pairs(eventOverlapsCollection) do
      v:Dispose()
    end
  end
  eventOverlapsCollection = nil
end

function AbyssWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.AbyssWindow.TRIGGER_BRANCH then
    RefreshTaskList()
  elseif msgId == WindowMsgEnum.AbyssWindow.TRIGGER_DELETE_BRANCH then
    RefreshTaskList()
  elseif msgId == WindowMsgEnum.AbyssWindow.BRANCH_COMPLETE then
  elseif msgId == WindowMsgEnum.Common.E_MSG_ITEM_CHANGE then
    RefreshPlayerAttributes()
  elseif msgId == WindowMsgEnum.AbyssWindow.ADD_FOCUSING_EVENT then
    for i, v in ipairs(mapflags) do
      if v.userdata == para then
        v:marker(true)
        break
      end
    end
  elseif msgId == WindowMsgEnum.AbyssWindow.REMOVE_FOCUSING_EVENT then
    for i, v in ipairs(mapflags) do
      if v.userdata == para then
        v:marker(false)
        break
      end
    end
  elseif msgId == WindowMsgEnum.AbyssWindow.REFRESH_BRANCHES then
    RefreshTaskList()
  elseif msgId == WindowMsgEnum.AbyssWindow.ENABLE_CAMERA_BUTTON then
    uis.Main.c1Ctr.selectedIndex = para and 1 or 0
  elseif msgId == WindowMsgEnum.AbyssWindow.EVENT_COMPLETE then
    DailyTaskService.GetCommonTaskInfoReq()
    UpdateEntranceState()
    RefreshPanelInfo()
  elseif msgId == WindowMsgEnum.Common.E_MSG_DAILY_TASK_UPDATE then
    RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.TASK)
    UpdateTaskInfo()
  elseif msgId == WindowMsgEnum.Common.E_MSG_UPDATE_BATTERY then
    UpdateBatteryLevel()
  elseif msgId == WindowMsgEnum.AbyssWindow.SET_VISIBLE then
    SetCompsVisible(para)
  elseif msgId == WindowMsgEnum.AbyssWindow.ENABLE_POPUP_EVENT_TIPS then
    enablePopupEventTips = para
  elseif msgId == WindowMsgEnum.AbyssWindow.HANDLE_FIRST_EVENT then
    if eventTipsRoot and eventTipsRoot.visible then
      local list = eventTipsRoot:GetChild("EventTipsList")
      if list.numItems > 0 then
        local child = list:GetChildAt(0)
        local subchild = child:GetChild("EventTips")
        subchild.onClick:Call()
      end
    end
  elseif msgId == WindowMsgEnum.AbyssWindow.REFRESH_EVENT_DISPLAY_INFO then
    RefreshEventDisplayInfo()
  elseif msgId == WindowMsgEnum.AbyssWindow.NEWBIE_ZONE_CLEARED then
    uis.Main.FunctionOpenBtn.visible = false
  elseif msgId == WindowMsgEnum.AbyssWindow.TIDE_DUNGEON_REFRESH then
    RedDotMgr.UpdateNodeByWindowName(WinResConfig.AbyssWindow.name)
  end
end

return AbyssWindow
