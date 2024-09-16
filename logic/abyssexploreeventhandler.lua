local CheckAndHandle = function(eventInfo, handleCallback)
  if AbyssExploreMgr.EventIsHandleable(eventInfo, false) and handleCallback then
    handleCallback()
  end
end
local OnTriggerBattle = function(grid, eventInfo, stageId)
  local type = eventInfo.type
  if type == AbyssExploreEventID.POSITIVE or type == AbyssExploreEventID.DAILY_RANDOM or type == AbyssExploreEventID.DAILY_RANDOM_NEWBIE then
    if AbyssExploreMgr.RegionIsCleared(1) then
      CheckAndHandle(eventInfo, function()
        OpenWindow(WinResConfig.AbyssBattleEventHandleWindow.name, nil, grid, eventInfo)
      end)
    else
      CheckAndHandle(eventInfo, function()
        AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.TRIGGER_BATTLE, grid, eventInfo)
        AbyssExploreMgr.PrepareEnterBattle(eventInfo, stageId)
      end)
    end
  elseif type == AbyssExploreEventID.BRANCH or type == AbyssExploreEventID.BRANCH_ACTIVITY or type == AbyssExploreEventID.BUILDING_RANDOM then
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.TRIGGER_BATTLE, grid, eventInfo)
    AbyssExploreMgr.PrepareEnterBattle(eventInfo, stageId)
  end
end
local OnTriggerDialogue = function(grid, eventInfo, storyId, callback)
  local type = eventInfo.type
  if type == AbyssExploreEventID.POSITIVE or type == AbyssExploreEventID.DAILY_RANDOM or type == AbyssExploreEventID.DAILY_RANDOM_NEWBIE then
    CheckAndHandle(eventInfo, function()
      if not eventInfo.direct then
        AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.TRIGGER_DIALOGUE, grid, eventInfo)
        OpenWindow(WinResConfig.MoveEventTipsWindow.name, nil, storyId, eventInfo, callback)
      else
        AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.TRIGGER_DIALOGUE, grid, eventInfo, function()
          OpenWindow(WinResConfig.MoveEventTipsWindow.name, nil, storyId, eventInfo, callback)
        end)
      end
    end)
  elseif type == AbyssExploreEventID.BRANCH or type == AbyssExploreEventID.BRANCH_ACTIVITY then
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.TRIGGER_DIALOGUE, grid, eventInfo)
    OpenWindow(WinResConfig.CardPlotTalkWindow.name, nil, false, storyId, eventInfo, callback)
  elseif type == AbyssExploreEventID.BUILDING_RANDOM then
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.TRIGGER_DIALOGUE, grid, eventInfo)
    OpenWindow(WinResConfig.RandomTipsWindow.name, nil, storyId, eventInfo, callback)
  else
    printError("[ABYSS]\230\151\160\230\173\164\231\177\187\229\158\139\229\175\185\232\175\157\239\188\129\239\188\129\239\188\129")
  end
end
local OnTriggerTreasure = function(grid, eventInfo)
  local type = eventInfo.type
  if type == AbyssExploreEventID.POSITIVE or type == AbyssExploreEventID.DAILY_RANDOM or type == AbyssExploreEventID.DAILY_RANDOM_NEWBIE then
    CheckAndHandle(eventInfo, function()
      AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.TRIGGER_TREASURE, grid, eventInfo)
      AbyssExploreMgr.ProcessEvent(eventInfo)
    end)
  elseif type == AbyssExploreEventID.BUILDING_RANDOM then
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.TRIGGER_TREASURE, grid, eventInfo)
    AbyssExploreMgr.ProcessEvent(eventInfo)
  end
end
local OnTriggerIndicate = function(grid, eventInfo)
  AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.TRIGGER_INDICATE, grid, eventInfo)
  CheckAndHandle(eventInfo, function()
    OpenWindow(WinResConfig.GuideBoardWindow.name, nil, eventInfo)
  end)
end
local OnTriggerBranch = function(grid, eventInfo)
  if eventInfo.nextPlotNodeId > 0 then
    local nodeConf = TableData.GetConfig(eventInfo.nextPlotNodeId, "BaseManorNode")
    local param = nodeConf.parameter
    if nodeConf.cost and _G.next(nodeConf.cost) then
      local processable = true
      for _, v in pairs(nodeConf.cost) do
        local splits = Split(v, ":")
        if splits and 3 == #splits then
          processable = ActorData.GetItemCount(tonumber(splits[2])) >= tonumber(splits[3])
          if not processable then
            break
          end
        end
      end
      if not processable then
        FloatTipsUtil.ShowWarnTips(T(20035))
        return
      end
    end
    if nodeConf.type == AbyssExploreBranchNodeType.BATTLE then
      OnTriggerBattle(grid, eventInfo, tonumber(param))
    elseif nodeConf.type == AbyssExploreBranchNodeType.DIALOGUE then
      OnTriggerDialogue(grid, eventInfo, tonumber(param), function()
        local nodeCoordinate = AbyssExploreMgr.CalcPlotNodeCoordinate(eventInfo)
        AbyssExploreMgr.ProcessEvent(eventInfo, nodeCoordinate)
      end)
    else
      if nodeConf.type == AbyssExploreBranchNodeType.GAIN then
        AbyssExploreMgr.ProcessEvent(eventInfo)
      else
      end
    end
    local view = eventInfo.view
    if view and not view:IsNull() then
      local eff = view.transform:GetChild(0)
      eff.gameObject:SetActive(false)
    end
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.TRIGGER_BRANCH, grid, eventInfo, false)
  else
    local evtConf = TableData.GetConfig(eventInfo.eventId, "BaseManorEvent")
    if evtConf.open_card and not CardData.GetCardDataById(tonumber(evtConf.open_card)) then
      return
    end
    AbyssExploreMgr.TriggerBranch(eventInfo)
  end
end
local OnTriggerBuilding = function(grid, eventInfo)
  local param = eventInfo.param
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.TIDE_DUNGEON) then
    ld("TideDungeon")
    AbyssExploreMgr.EnableGestureOp(false)
    TideDungeonService.GetTideDungeonInfoReq(AbyssTideDungeon, function()
      OpenWindow(WinResConfig.TideWindow.name)
      AbyssExploreMgr.EnableGestureOp(true)
    end)
  end
end
local OnTriggerIllustrationsBGM = function(grid, eventInfo)
  AbyssExploreMgr.ProcessEvent(eventInfo)
end
local OnTriggerIllustrationsMonster = function(grid, eventInfo)
  AbyssExploreMgr.ProcessEvent(eventInfo)
end
local OnTriggerExpedition = function(grid, eventInfo)
  local window = UIMgr:GetTopWindow()
  if window ~= WinResConfig.AbyssWindow.name and window ~= WinResConfig.HomeWindow.name and window ~= WinResConfig.AbyssButtonTipsWindow.name then
    return
  end
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_DREAMLAND) then
    OpenWindow(WinResConfig.ExpeditionWindow.name)
  end
end
local OnTriggerChallengeBoss = function(grid, eventInfo)
  if eventInfo.type == AbyssExploreEventID.CHALLENGE_BOSS and not string.isEmptyOrNil(eventInfo.param) and EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_BOSS) then
    local arr = Split(eventInfo.param, "|")
    if #arr > 0 then
      local chapterId = {}
      for i, v in ipairs(arr) do
        table.insert(chapterId, tonumber(v))
      end
      local chapterData = TableData.GetConfig(chapterId[1], "BaseChapter")
      if chapterData.type then
        AbyssExploreMgr.EnableGestureOp(false)
        ld("BossDungeon", function()
          AdventureService.GetSceneInfoReq({
            chapterData.type
          }, function()
            BossDungeonMgr.OpenWindow(chapterData.type, chapterId)
            AbyssExploreMgr.EnableGestureOp(true)
          end)
        end)
      end
    end
  end
end
local OnTriggerRoguelike = function(grid, eventInfo)
  local window = UIMgr:GetTopWindow()
  if window ~= WinResConfig.AbyssWindow.name and window ~= WinResConfig.HomeWindow.name and window ~= WinResConfig.AbyssButtonTipsWindow.name then
    return
  end
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_ROGUE) then
    AbyssExploreMgr.EnableGestureOp(false)
    ld("Rogue", function()
      RogueService.GetRogueInfoReq(function()
        OpenWindow(WinResConfig.RogueWindow.name)
        AbyssExploreMgr.EnableGestureOp(true)
      end)
    end)
  end
end
local OnTriggerPortal = function(grid, eventInfo)
  CheckAndHandle(eventInfo, function()
    AbyssExploreMgr.ProcessEvent(eventInfo)
  end)
end
local OnTriggerFrostDungeon = function(grid, eventInfo)
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.FROST_DUNGEON) then
    ld("FrostDungeon")
    FrostDungeonService.GetFrostDungeonInfoReq(function()
      OpenWindow(WinResConfig.FrostDungeonWindow.name)
    end)
  end
end
local OnTriggerGuildWar = function(grid, eventInfo)
  ld("GuildWar")
  GuildWarMgr.OpenGuildWarWindow()
end
local OnTriggerExploreAFK = function(grid, eventInfo)
  ld("ExploreAFK")
  OpenWindow(WinResConfig.ExploreWindow.name)
end
local HandleEvent = function(grid, eventInfo)
  local type, subtype = eventInfo.type, eventInfo.subtype
  if type == AbyssExploreEventID.POSITIVE or type == AbyssExploreEventID.BUILDING_RANDOM or type == AbyssExploreEventID.DAILY_RANDOM or type == AbyssExploreEventID.DAILY_RANDOM_NEWBIE then
    local eventParam = eventInfo.param
    if subtype == AbyssExploreSubEventID.BATTLE then
      OnTriggerBattle(grid, eventInfo, tonumber(eventParam))
    elseif subtype == AbyssExploreSubEventID.DIALOGUE then
      OnTriggerDialogue(grid, eventInfo, tonumber(eventParam), function(...)
        AbyssExploreMgr.ProcessEvent(eventInfo, ...)
      end)
    elseif subtype == AbyssExploreSubEventID.TREASURE then
      OnTriggerTreasure(grid, eventInfo)
    elseif subtype == AbyssExploreSubEventID.INDICATE then
      OnTriggerIndicate(grid, eventInfo)
    end
  elseif type == AbyssExploreEventID.BRANCH or type == AbyssExploreEventID.BRANCH_ACTIVITY then
    OnTriggerBranch(grid, eventInfo)
  elseif type == AbyssExploreEventID.BUILDING then
    OnTriggerBuilding(grid, eventInfo)
  elseif type == AbyssExploreEventID.ILLUSTRATIONS_BGM then
    OnTriggerIllustrationsBGM(grid, eventInfo)
  elseif type == AbyssExploreEventID.ILLUSTRATIONS_MONSTER then
    OnTriggerIllustrationsMonster(grid, eventInfo)
  elseif type == AbyssExploreEventID.EXPEDITION_BUILDING then
    OnTriggerExpedition(grid, eventInfo)
  elseif type == AbyssExploreEventID.CHALLENGE_BOSS then
    OnTriggerChallengeBoss(grid, eventInfo)
  elseif type == AbyssExploreEventID.ROGUELIKE then
    OnTriggerRoguelike(grid, eventInfo)
  elseif type == AbyssExploreEventID.PORTAL then
    OnTriggerPortal(grid, eventInfo)
  elseif type == AbyssExploreEventID.FROST_DUNGEON then
    OnTriggerFrostDungeon(grid, eventInfo)
  elseif type == AbyssExploreEventID.GUILD_WAR_ENTRANCE then
    OnTriggerGuildWar(grid, eventInfo)
  elseif type == AbyssExploreEventID.EXPLORE_AFK then
    OnTriggerExploreAFK(grid, eventInfo)
  end
  AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.TRIGGER_EVENT, grid, eventInfo)
  print(string.format("[ABYSS]\228\186\139\228\187\182ID:%s,\228\186\139\228\187\182\231\177\187\229\158\139:%s,\229\173\144\231\177\187\229\158\139:%s,\229\174\140\230\136\144\230\151\182\233\151\180:%s,\233\135\141\231\189\174\230\151\182\233\151\180:%s,param:%s", tostring(eventInfo.eventId), tostring(type), tostring(subtype), tostring(eventInfo.finishTimestamp), tostring(eventInfo.resetTimestamp), tostring(eventInfo.param)))
end
local popupEvents = {
  AbyssExploreEventID.POSITIVE,
  AbyssExploreEventID.BRANCH,
  AbyssExploreEventID.BRANCH_ACTIVITY,
  AbyssExploreEventID.DAILY_RANDOM,
  AbyssExploreEventID.DAILY_RANDOM_NEWBIE,
  AbyssExploreEventID.BUILDING,
  AbyssExploreEventID.EXPEDITION_BUILDING,
  AbyssExploreEventID.CHALLENGE_BOSS,
  AbyssExploreEventID.ILLUSTRATIONS_BGM,
  AbyssExploreEventID.ILLUSTRATIONS_MONSTER,
  AbyssExploreEventID.ROGUELIKE,
  AbyssExploreEventID.PORTAL,
  AbyssExploreEventID.FROST_DUNGEON,
  AbyssExploreEventID.GUILD_WAR_ENTRANCE,
  AbyssExploreEventID.EXPLORE_AFK
}
local IsNeedPopupEvent = function(eventInfo)
  for _, v in pairs(popupEvents) do
    if eventInfo.type == v then
      return true
    end
  end
  return false
end
local eventsBuffer
local CollectEventsAround = function(grid)
  local coordinate = grid.coordinate
  local cX, cY = coordinate.x, coordinate.y
  local grids = AbyssExploreMapCtrl.GetGridsAroundCenter(coordinate.x, coordinate.y, 1, 1, function(o)
    local x = o.coordinate.x - cX
    local y = o.coordinate.y - cY
    local dist = Vector3.Distance(o.center, grid.center)
    if dist > 1 then
      return false
    end
    local eventInfo = o.userdata
    if not eventInfo then
      return false
    end
    local sqr = x * x + y * y
    if sqr > 2 then
      return false
    end
    local type = eventInfo.type
    if not eventInfo.hasRes and (type == AbyssExploreEventID.POSITIVE or type == AbyssExploreEventID.BRANCH or type == AbyssExploreEventID.BRANCH_ACTIVITY or type == AbyssExploreEventID.DAILY_RANDOM or type == AbyssExploreEventID.DAILY_RANDOM_NEWBIE) then
      return false
    end
    if AbyssExploreMgr.IsFinished(eventInfo.eventId) then
      return false
    end
    if eventInfo.type == AbyssExploreEventID.BUILDING then
      local param = eventInfo.param
      local dungeonType = tonumber(param)
      if dungeonType == ProtoEnum.SCENE_TYPE.MANOR_FIR then
        return true
      end
      local info = TideDungeonData.GetTideDungeonInfo(dungeonType)
      if info then
        return info.inOpenTime
      end
    end
    return IsNeedPopupEvent(eventInfo)
  end)
  if not eventsBuffer then
    eventsBuffer = {}
  end
  table.clear(eventsBuffer)
  for i = 0, grids.Count - 1 do
    local event = grids[i].userdata
    local exists = false
    for i, v in pairs(eventsBuffer) do
      if v.eventId == event.eventId then
        exists = true
        break
      end
    end
    if not exists then
      table.insert(eventsBuffer, event)
    end
  end
  AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.POPUP_EVENT_TIPS, eventsBuffer)
  return eventsBuffer
end
local gridCache
local OnCHRInit = function(fashionId, position)
  gridCache = AbyssExploreMapCtrl.WorldToGrid(position)
end
local OnCHRConvey = function(coordinate)
  local splits = Split(coordinate, ":")
  local position = AbyssExploreMapCtrl.GridToWorld(tonumber(splits[1]), tonumber(splits[2]))
  if not position then
    printError("[ABYSS]Convey Illegal coordinate", coordinate)
    return
  end
  AbyssExploreChrCtrl.SetPosition(position.x, position.y)
  local eff = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_ui_mapadventure_portal_eff.prefab")
  eff.transform.position = position
  LuaUtil.SetEffectSetting(eff, function()
    ResourceManager.DestroyGameObject(eff)
  end)
end
local OnCHRMoving = function(position, nextPosition, dstPosition)
  local grid = AbyssExploreMapCtrl.WorldToGrid(position)
  if not grid then
    return
  end
  local eventInfo = grid.userdata
  local changed = false
  if gridCache ~= grid then
    if gridCache.regionId ~= grid.regionId then
      AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.REGION_CHANGE, gridCache.regionId, grid.regionId)
    end
    gridCache = grid
    changed = true
  end
  local dstGrid = AbyssExploreMapCtrl.WorldToGrid(dstPosition)
  local needReportPos = false
  local reached = dstGrid == grid
  if dstGrid.userdata and eventInfo and dstGrid.userdata.eventId == eventInfo.eventId then
    reached = true
  end
  local nextGrid = AbyssExploreMapCtrl.WorldToGrid(nextPosition)
  if nextGrid and nextGrid.isObstacle then
    AbyssExploreChrCtrl.StopMovingAfter(0)
  end
  if changed then
    local handle = false
    needReportPos = true
    if eventInfo then
      local type = eventInfo.type
      if type == AbyssExploreEventID.BRANCH or type == AbyssExploreEventID.BRANCH_ACTIVITY or eventInfo.direct then
        handle = true
      elseif reached then
        handle = not IsNeedPopupEvent(eventInfo)
      end
    end
    if handle then
      HandleEvent(grid, eventInfo)
    end
    AbyssExploreMgr.ReportPosition(grid)
  end
  UIMgr:SendWindowMessage(WinResConfig.AbyssBigMapWindow.name, WindowMsgEnum.AbyssBigMapWindow.UPDATE_PLAYER_POSITION, position)
end
local OnCHRMoveNext = function(position, nextPosition, destPosition)
  local grid = AbyssExploreMapCtrl.WorldToGrid(nextPosition)
  local dstGrid = AbyssExploreMapCtrl.WorldToGrid(destPosition)
  local reached = grid == dstGrid
  local eventInfo = grid.userdata
  if dstGrid.userdata and eventInfo and dstGrid.userdata.eventId == eventInfo.eventId then
    reached = true
  end
  local handle = false
  if eventInfo and not eventInfo.passable then
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.TRIGGER_UNPASSABLE, grid, eventInfo)
    if not reached then
      FloatTipsUtil.ShowWarnTips(T(20105))
    else
      handle = not IsNeedPopupEvent(eventInfo)
    end
  end
  if handle then
    HandleEvent(grid, eventInfo)
  end
end
local OnCHRReachedDst = function(position)
  local grid = AbyssExploreMapCtrl.WorldToGrid(position)
  local eventInfo = grid.userdata
  local handle = false
  if eventInfo then
    handle = not IsNeedPopupEvent(eventInfo)
  end
  if handle then
    HandleEvent(grid, eventInfo)
  end
  AbyssExploreMgr.ReportPosition(grid)
end
local OnCHRStopMoving = function()
  local position = AbyssExploreChrCtrl.GetPosition()
  local grid = AbyssExploreMapCtrl.WorldToGrid(position)
  CollectEventsAround(grid)
end
local OnEventCreate = function(grid, eventInfo, initializing)
  local type = eventInfo.type
  if (type == AbyssExploreEventID.BRANCH or type == AbyssExploreEventID.BRANCH_ACTIVITY) and 0 == eventInfo.finishTimestamp and eventInfo.nextPlotNodeId > 0 then
    AbyssExploreData.InsertBranchEvent(eventInfo)
    if eventInfo.plotNodeId > 0 then
      UIMgr:SendWindowMessage(WinResConfig.AbyssWindow.name, WindowMsgEnum.AbyssWindow.TRIGGER_BRANCH, eventInfo)
    end
  end
end
local OnEventDelete = function(grid, eventInfo)
  AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.EVENT_UNFOCUS, eventInfo)
  local type = eventInfo.type
  if type == AbyssExploreEventID.BRANCH or type == AbyssExploreEventID.BRANCH_ACTIVITY then
    AbyssExploreData.DeleteBranchEvent(eventInfo)
    UIMgr:SendWindowMessage(WinResConfig.AbyssWindow.name, WindowMsgEnum.AbyssWindow.TRIGGER_DELETE_BRANCH, eventInfo)
  end
  UIMgr:SendWindowMessage(WinResConfig.AbyssWindow.name, WindowMsgEnum.AbyssWindow.EVENT_DELETE, eventInfo)
end
local OnEventComplete = function(eventInfo)
  local e_type, e_subtype = eventInfo.type, eventInfo.subtype
  if e_type == AbyssExploreEventID.BRANCH or e_type == AbyssExploreEventID.BRANCH_ACTIVITY then
    AbyssExploreData.InsertCompletedBranchEvent(eventInfo)
    UIMgr:SendWindowMessage(WinResConfig.AbyssWindow.name, WindowMsgEnum.AbyssWindow.BRANCH_COMPLETE, eventInfo)
  end
  UIMgr:SendWindowMessage(WinResConfig.AbyssWindow.name, WindowMsgEnum.AbyssWindow.EVENT_COMPLETE, eventInfo)
  local eventId = TableData.GetConfig(70010814, "BaseFixed").int_value
  if eventInfo.eventId == eventId then
    AbyssExploreMgr.CheckHasAnyFunctionUnlock()
    AbyssExploreMgr.CheckAnyActivityBranches()
    UIMgr:CloseWindow(WinResConfig.AbyssButtonTipsWindow.name)
    UIMgr:SendWindowMessage(WinResConfig.AbyssWindow.name, WindowMsgEnum.AbyssWindow.NEWBIE_ZONE_CLEARED, nil)
    AbyssExploreMgr.GetExploreInfo(function(msg)
      AbyssExploreData.SetManorInfo(msg.manorInfo)
      RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ABYSS)
    end)
  end
  local configTbl = TableData.GetTable("BaseManorMapSub")
  local anyRegionUnlock = false
  for _, item in pairs(configTbl) do
    if type(item.open_event) == "number" and item.open_event == eventInfo.eventId then
      local dont_display_ui = true
      anyRegionUnlock = true
      AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.REGION_UNLOCK, item.id, dont_display_ui)
    end
  end
  if e_type == AbyssExploreEventID.POSITIVE and e_subtype == AbyssExploreSubEventID.TREASURE then
    RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ABYSS)
  end
  if anyRegionUnlock then
    UIMgr:SendWindowMessage(WinResConfig.AbyssWindow.name, WindowMsgEnum.AbyssWindow.REFRESH_EVENT_DISPLAY_INFO, nil)
  end
  eventsBuffer = eventsBuffer or {}
  table.clear(eventsBuffer)
  AbyssExploreData.GetEventsByType(AbyssExploreEventID.PORTAL, eventsBuffer)
  for i, v in pairs(eventsBuffer) do
    local unlock
    local precondition = v.precondition
    if precondition and table.keyof(precondition, eventInfo.eventId) then
      unlock = true
      for _, id in ipairs(precondition) do
        if not AbyssExploreMgr.IsFinished(id) then
          unlock = false
          break
        end
      end
    end
    if unlock then
      local op = AbyssExploreFramingOperation.CreateOperation(OP_TYPE.CINEMATICS, true)
      op.args.eventInfo = v
      op.args.isTimeline = true
    end
  end
end
local OnEventWinClose = function(eventInfo)
end
local OnBattleStart = function(msg)
  AbyssExploreMgr.SetActive(false)
end
local OnBattleComplete = function(msg)
  local isWin = msg.win
  local sceneType = msg.sceneType
  if sceneType == ProtoEnum.SCENE_TYPE.MANOR then
    local initData = msg.battleData.initData
    local extData = initData.extData
    if isWin and not string.isEmptyOrNil(extData) then
      local splits = Split(extData, "|")
      local eventId = tonumber(splits[1])
      local events = AbyssExploreData.GetAllEvents()
      local event = events[eventId]
      if event then
        local type = event.type
        if (type == AbyssExploreEventID.POSITIVE or type == AbyssExploreEventID.DAILY_RANDOM or type == AbyssExploreEventID.DAILY_RANDOM_NEWBIE or type == AbyssExploreEventID.BUILDING_RANDOM) and event.subtype == AbyssExploreSubEventID.DIALOGUE or type == AbyssExploreEventID.BRANCH or type == AbyssExploreEventID.BRANCH_ACTIVITY then
          local storyId = tonumber(splits[3])
          if not event.storyRecords then
            event.storyRecords = {}
          end
          local storyRecords = event.storyRecords
          local cnt = #storyRecords
          if cnt > 0 then
            local prev = storyRecords[cnt]
            local conf = TableData.GetConfig(prev, "BaseStorySimple")
            if conf.type == AbyssExploreStoryItemType.OPTION then
              local flag = false
              for i, v in ipairs(conf.option_next) do
                if tonumber(v) == storyId then
                  flag = true
                  break
                end
              end
              if flag then
                if not event.optionRecords then
                  event.optionRecords = {}
                end
                local optionRecords = event.optionRecords
                table.insert(optionRecords, storyId)
              end
            end
          end
          table.insert(event.storyRecords, storyId)
          print(string.format("[ABYSS]%s Battle Complete story id : %s", eventId, storyId))
        end
      end
    end
    if initData.quickBattle then
      UIMgr:CloseWindow(WinResConfig.AbyssBattleEventHandleWindow.name)
    end
  elseif (sceneType == ProtoEnum.SCENE_TYPE.MANOR_FIR or sceneType == ProtoEnum.SCENE_TYPE.MANOR_WOOD or sceneType == ProtoEnum.SCENE_TYPE.MANOR_WATER) and isWin then
    TideDungeonService.GetTideDungeonInfoReq(sceneType)
  end
end
local OnHandleEvent = function(eventInfo)
  HandleEvent(gridCache, eventInfo)
end
local OnHandleEventNoPosition = function(eventInfo)
  if eventInfo.finishTimestamp <= 0 then
    local type = eventInfo.type
    if type == AbyssExploreEventID.DAILY_RANDOM or type == AbyssExploreEventID.DAILY_RANDOM_NEWBIE then
      local position = AbyssExploreChrCtrl.GetPosition()
      if AbyssExploreChrCtrl.IsMoving() then
        position = AbyssExploreChrCtrl.StopMovingAfter(1)
      end
      local grid = AbyssExploreMapCtrl.WorldToGrid(position)
      local coordinate = grid.coordinate
      eventInfo.positions = {
        [1] = coordinate
      }
      eventInfo.x = coordinate.x
      eventInfo.y = coordinate.y
      eventInfo.location = coordinate
      eventInfo.assetpath = TableData.GetConfig(eventInfo.eventId, "BaseManorEvent").spd
      AbyssExploreMgr.ReportEventPosition(eventInfo, coordinate, function()
        AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.EVENT_UPDATE, eventInfo)
      end)
      return
    end
    HandleEvent(gridCache, eventInfo)
  end
end
local OnHandleCurLocationEvent = function()
  local position = AbyssExploreChrCtrl.GetPosition()
  local grid = AbyssExploreMapCtrl.WorldToGrid(position)
  local eventInfo = grid.userdata
  if eventInfo then
    local handle = false
    local type = eventInfo.type
    if type == AbyssExploreEventID.BRANCH or type == AbyssExploreEventID.BRANCH_ACTIVITY or eventInfo.direct then
      handle = true
    end
    if handle then
      HandleEvent(grid, eventInfo)
    end
  end
end
local OnCollectEvents = function()
  if not AbyssExploreMgr.Exists() then
    return
  end
  if AbyssExploreChrCtrl.IsMoving() then
    return
  end
  local grid = AbyssExploreMapCtrl.WorldToGrid(AbyssExploreChrCtrl.GetPosition())
  CollectEventsAround(grid)
end
local encode_buffer
local OnFocusEvent = function(eventInfo)
  if AbyssExploreData.AddFocus(eventInfo) then
    if not encode_buffer then
      encode_buffer = {}
    end
    table.clear(encode_buffer)
    local events = AbyssExploreData.GetFocusEvents()
    for i, v in pairs(events) do
      table.insert(encode_buffer, v.eventId)
    end
    PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.ABYSS_MAP_FLAGS_RECORDS, Json.encode(encode_buffer))
    UIMgr:SendWindowMessage(WinResConfig.AbyssWindow.name, WindowMsgEnum.AbyssWindow.ADD_FOCUSING_EVENT, eventInfo)
    UIMgr:SendWindowMessage(WinResConfig.AbyssBigMapWindow.name, WindowMsgEnum.AbyssBigMapWindow.ADD_FOCUSING_EVENT, eventInfo)
  else
    FloatTipsUtil.ShowWarnTips(T(20028))
    UIMgr:SendWindowMessage(WinResConfig.AbyssBigMapWindow.name, WindowMsgEnum.AbyssBigMapWindow.FOCUSING_EVENT_MAX, eventInfo)
  end
end
local OnUnfocusEvent = function(eventInfo)
  if AbyssExploreData.RemoveFocus(eventInfo.eventId) then
    if not encode_buffer then
      encode_buffer = {}
    end
    table.clear(encode_buffer)
    local events = AbyssExploreData.GetFocusEvents()
    for i, v in pairs(events) do
      table.insert(encode_buffer, v.eventId)
    end
    PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.ABYSS_MAP_FLAGS_RECORDS, Json.encode(encode_buffer))
    AbyssExploreMapCtrl.HidePath(eventInfo.eventId)
    UIMgr:SendWindowMessage(WinResConfig.AbyssWindow.name, WindowMsgEnum.AbyssWindow.REMOVE_FOCUSING_EVENT, eventInfo)
    UIMgr:SendWindowMessage(WinResConfig.AbyssBigMapWindow.name, WindowMsgEnum.AbyssBigMapWindow.REMOVE_FOCUSING_EVENT, eventInfo)
  end
end
local OnPathfindSuccess = function(from, to, points, type, _, unwalkalbePosints, eventInfo)
  if type == AbyssPathfindingType.Navigation_Event or type == AbyssPathfindingType.Navigation_Branch then
    if unwalkalbePosints then
      for i = #unwalkalbePosints, 1, -1 do
        points:Add(unwalkalbePosints[i])
      end
    end
    local cnt = points.Count
    for i = cnt - 1, 0, -1 do
      local grid = AbyssExploreMapCtrl.WorldToGrid(points[i])
      local userdata = grid.userdata
      if userdata and not userdata.passable then
        points:RemoveAt(i)
      else
        break
      end
    end
    local epsilon = 0.001
    if epsilon > Vector3.Distance(from, points[points.Count - 1]) then
      AbyssExploreMapCtrl.HidePath(eventInfo.eventId)
    else
      AbyssExploreMapCtrl.ShowPath(eventInfo.eventId, points, true, true)
    end
    UIMgr:SendWindowMessage(WinResConfig.AbyssBigMapWindow.name, WindowMsgEnum.AbyssBigMapWindow.UPDATE_TRACKED_EVENT_PATH, points)
  end
end
local OnPathfindFailure = function(from, to, type, _, _, eventInfo)
end
local OnUpdatePlayerInfo = function(prevInfo, curInfo)
  if prevInfo and curInfo then
    local level0 = prevInfo.mapLevel
    local level1 = curInfo.mapLevel
    RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ABYSS)
  end
end
local OnResetCamera = function()
  AbyssExploreMgr.EnableCameraFollow(true)
end
local OnEnableResetCameraButton = function(enable)
  UIMgr:SendWindowMessage(WinResConfig.AbyssWindow.name, WindowMsgEnum.AbyssWindow.ENABLE_CAMERA_BUTTON, enable)
end
local OnClickCHR = function(point)
  if AbyssExploreChrCtrl.IsMoving() then
    return
  end
  OpenWindow(WinResConfig.QBSwitchWindow.name)
end
local OnGoToEvent = function(event, param)
  if type(event) == "number" then
    local allEvents = AbyssExploreData.GetAllEvents()
    event = allEvents[event]
  end
  local positions = event.positions
  if positions and _G.next(positions) then
    if #positions > 1 then
      local location = event.location
      UIMgr:CloseWindow(WinResConfig.AbyssActivityWindow.name)
      AbyssExploreMgr.SearchPathToGrid(location.x, location.y, AbyssPathfindingType.Positive)
    else
      UIMgr:CloseWindow(WinResConfig.AbyssActivityWindow.name)
      local x, y = positions[1].x, positions[1].y
      if event.type == AbyssExploreEventID.DAILY_RANDOM or event.type == AbyssExploreEventID.DAILY_RANDOM_NEWBIE then
        x, y = event.realpos.x, event.realpos.y
      end
      AbyssExploreMgr.SearchPathToGrid(x, y, AbyssPathfindingType.Positive)
    end
  end
end
local OnGoToBossChallenge = function(chapterId)
  UIMgr:CloseWindow(WinResConfig.AbyssActivityWindow.name)
  AbyssExploreMgr.GoToBossChallenge(chapterId)
end
return {
  OnCHRInit = OnCHRInit,
  OnCHRConvey = OnCHRConvey,
  OnCHRMoving = OnCHRMoving,
  OnCHRMoveNext = OnCHRMoveNext,
  OnCHRReachedDst = OnCHRReachedDst,
  OnCHRStopMoving = OnCHRStopMoving,
  OnEventCreate = OnEventCreate,
  OnEventDelete = OnEventDelete,
  OnEventComplete = OnEventComplete,
  OnEventWinClose = OnEventWinClose,
  OnBattleStart = OnBattleStart,
  OnBattleComplete = OnBattleComplete,
  OnHandleEvent = OnHandleEvent,
  OnHandleEventNoPosition = OnHandleEventNoPosition,
  OnHandleCurLocationEvent = OnHandleCurLocationEvent,
  OnFocusEvent = OnFocusEvent,
  OnUnfocusEvent = OnUnfocusEvent,
  OnPathfindSuccess = OnPathfindSuccess,
  OnPathfindFailure = OnPathfindFailure,
  OnUpdatePlayerInfo = OnUpdatePlayerInfo,
  OnResetCamera = OnResetCamera,
  OnEnableResetCameraButton = OnEnableResetCameraButton,
  OnClickCHR = OnClickCHR,
  OnCollectEvents = OnCollectEvents,
  OnGoToEvent = OnGoToEvent,
  OnGoToBossChallenge = OnGoToBossChallenge
}
