require("Abyss_CardPlotListWindowByName")
require("Abyss_CardPlotListTipsAniByName")
local CardPlotListWindow = {}
local uis, contentPane, selectedIndex
local Branches = {
  [1] = {
    title = T(20342),
    filter = function(event)
      local config = TableData.GetConfig(event.eventId, "BaseManorEvent")
      if type(config.open_card) == "number" then
        return CardData.GetCardDataById(config.open_card)
      end
      return true
    end
  },
  [2] = {
    title = T(20343),
    filter = function(event)
      local config = TableData.GetConfig(event.eventId, "BaseManorEvent")
      if type(config.open_card) == "number" then
        return not CardData.GetCardDataById(config.open_card)
      end
      return false
    end
  }
}
local cardBranches = {}
local selectedBranchIndex
local BRANCH_ITEM_TYPE = {
  LINE = 0,
  BRANCH = 1,
  EMPTY_BRANCH = 2
}
local targetHolder, targetPosition, hasInProgressBranch
local SetPlotItem = function(gcmp, cardId, branches)
  local child = gcmp:GetChild("DetailsTipsTitle")
  local head = child:GetChild("Head")
  local scheduleList = child:GetChild("ScheduleList")
  local loader = head:GetChild("HeadBg"):GetChild("PicLoader")
  local picLoader = child:GetChild("PicLoader")
  local conf = TableData.GetConfig(cardId, "BaseCard")
  UIUtil.SetBtnText(head, conf.name(), "NameTxt")
  UIUtil.SetHeadByFaceId(conf.fashion_id, loader, HEAD_ICON_TYPE_ENUM.RECT)
  
  function scheduleList.itemRenderer(j, ggcmp)
    local branch = branches[j + 1]
    local lighten = branch.finishTimestamp > 0 or branch.nextPlotNodeId > 0
    ChangeUIController(ggcmp, "c1", lighten and 1 or 0)
  end
  
  scheduleList.numItems = #branches
  local picHolder = child:GetChild("PicHolder")
  if not picHolder then
    picHolder = CS.FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
    child:AddChildAt(picHolder, child:GetChildIndex(picLoader))
    UIUtil.SetHolderCenter(picHolder)
  end
end
local PlotItemRenderer = function(i, gcmp)
  local index = i + 1
  local child = gcmp:GetChild("CardPlotListTips")
  child.alpha = 0
  PlayUITrans(gcmp, "in", nil, i * 0.08)
  local picHolder = child:GetChild("PicHolder")
  if index <= #cardBranches then
    local entry = cardBranches[index]
    local branches = entry.branches
    local cardId = entry.cardId
    local head = child:GetChild("Head")
    local scheduleList = child:GetChild("ScheduleList")
    local conf = TableData.GetConfig(cardId, "BaseCard")
    UIUtil.SetBtnText(head, conf.name(), "NameTxt")
    local loader = head:GetChild("HeadBg"):GetChild("PicLoader")
    local picLoader = child:GetChild("PicLoader")
    local eventConf = TableData.GetConfig(branches[1].eventId, "BaseManorEvent")
    local go = ResourceManager.Instantiate(eventConf.icon)
    SkeletonAnimationUtil.SetAnimation(go, 0, "idle", false, nil, true, "0")
    if not picHolder then
      picHolder = CS.FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
      child:AddChildAt(picHolder, child:GetChildIndex(picLoader))
      UIUtil.SetHolderCenter(picHolder)
      picHolder.name = "PicHolder"
    end
    UIUtil.SetObjectToUI(go, picHolder)
    UIUtil.SetHeadByFaceId(conf.fashion_id, loader, HEAD_ICON_TYPE_ENUM.RECT)
    local count = #branches
    local processingCnt = count
    local allFinished = true
    for j = 1, count do
      local event = branches[j]
      if event.step == event.numNodes or 0 == event.nextPlotNodeId or event.suspend then
        processingCnt = processingCnt - 1
      end
      if 0 == event.finishTimestamp then
        allFinished = false
      end
    end
    local processing = processingCnt > 0
    local processingCardId = false
    for _, v in ipairs(cardBranches) do
      for _, branch in pairs(v.branches) do
        if (branch.step > 0 or branch.nextPlotNodeId > 0) and branch.step < branch.numNodes then
          processingCardId = v.cardId
          break
        end
      end
    end
    local owned = 1 == selectedBranchIndex
    if owned then
      if processing then
        UIUtil.SetText(child:GetChild("Progress"), T(20305), "NameTxt")
      end
      ChangeUIController(child, "c1", hasInProgressBranch and (processing and 2 or 1) or 0)
      child.onClick:Set(function()
        if owned then
          picHolder.visible = false
          uis.Main.c1Ctr.selectedIndex = 1
          local position = picLoader:TransformPoint(Vector2.zero, targetHolder.parent)
          targetHolder:SetXY(position.x, position.y)
          local o = ResourceManager.Instantiate(eventConf.icon)
          SkeletonAnimationUtil.SetAnimation(o, 0, "idle", false, nil, true, "0")
          UIUtil.SetObjectToUI(o, targetHolder, 10000)
          SkeletonAnimationUtil.SetAnimation(o, 0, "change", false, nil, true, "0")
          SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_explore_book_clip")
          local list = uis.Main.CardPlotDetails.TipsList
          local listItems = {}
          local lineCount = count + 1
          local branchIndex, lastInProgress = 1, false
          for _ = 1, lineCount do
            if branchIndex <= count then
              local branch = branches[branchIndex]
              local inProgress = branch.step < branch.numNodes and branch.nextPlotNodeId > 0 and not branch.suspend
              table.insert(listItems, {
                type = BRANCH_ITEM_TYPE.LINE,
                inProgress = inProgress or lastInProgress,
                left = not lastInProgress and inProgress
              })
              table.insert(listItems, {
                type = BRANCH_ITEM_TYPE.BRANCH,
                branch = branch,
                index = branchIndex,
                inProgress = inProgress
              })
              lastInProgress = inProgress
            else
              table.insert(listItems, {
                type = BRANCH_ITEM_TYPE.LINE,
                inProgress = lastInProgress,
                left = not lastInProgress
              })
              table.insert(listItems, {
                type = BRANCH_ITEM_TYPE.EMPTY_BRANCH
              })
            end
            branchIndex = branchIndex + 1
          end
          table.insert(listItems, {
            type = BRANCH_ITEM_TYPE.LINE,
            ending = true
          })
          lineCount = lineCount + 1
          
          function list.itemProvider(k)
            local item = listItems[k + 1]
            if item.type == BRANCH_ITEM_TYPE.LINE then
              return "ui://rs1gte22pw8trk"
            else
              return "ui://rs1gte22ioazqw"
            end
          end
          
          function list.itemRenderer(k, gggcpm)
            local item = listItems[k + 1]
            local child = gggcpm:GetChildAt(0)
            local left = item.left
            local inProgress = item.inProgress
            local ending = item.ending
            child.onClick:Clear()
            if item.type == BRANCH_ITEM_TYPE.LINE then
              if ending then
                ChangeUIController(child, "c1", 3)
              elseif inProgress then
                ChangeUIController(child, "c1", left and 1 or 2)
              else
                ChangeUIController(child, "c1", 0)
              end
            elseif item.type == BRANCH_ITEM_TYPE.BRANCH then
              local branch = item.branch
              local eventConf = TableData.GetConfig(branch.eventId, "BaseManorEvent")
              local step = math.min(math.max(branch.step + (branch.nextPlotNodeId > 0 and 1 or 0), 0), branch.numNodes)
              UIUtil.SetText(child, string.format("([color=#e6ff51]%s[/color]/%s)", step, branch.numNodes), "NumberTxt")
              UIUtil.SetText(child, eventConf.name(), "NameTxt")
              local picLoader = child:GetChild("PicLoader")
              picLoader.url = UIUtil.GetResUrl(eventConf.node_item)
              ChangeUIController(child, "c1", inProgress and 1 or 0)
              UIUtil.SetText(child:GetChild("Progress"), T(20064), "NameTxt")
              child.onClick:Set(function()
                if 0 == branch.finishTimestamp and 0 == branch.nextPlotNodeId then
                  if processingCardId then
                    local cardConf = TableData.GetConfig(processingCardId, "BaseCard")
                    local content = T(20248, cardConf.name())
                    FloatTipsUtil.ShowWarnTips(content)
                  else
                    local content = T(20217, conf.name())
                    MessageBox.Show(content, {
                      touchCallback = function()
                        AbyssExploreMgr.TriggerBranch(branch)
                        UIMgr:CloseWindow(WinResConfig.CardPlotListWindow.name)
                        UIMgr:CloseWindow(WinResConfig.CardPlotMainWindow.name)
                      end
                    }, {})
                  end
                else
                  if 0 == branch.finishTimestamp and branch.suspend then
                    FloatTipsUtil.ShowWarnTips(T(20216))
                    return
                  end
                  if 0 == branch.finishTimestamp and 0 == branch.nextPlotNodeId then
                    FloatTipsUtil.ShowWarnTips(T(20218))
                    return
                  end
                  if 0 == branch.step then
                    local nodeConf = TableData.GetConfig(branch.nextPlotNodeId, "BaseManorNode")
                    local name = type(nodeConf.name) == "function" and nodeConf.name() or "未配置" .. tostring(nodeConf.id)
                    local content = T(20215, name)
                    MessageBox.Show(content, {
                      touchCallback = function()
                        JumpToWindow(WinResConfig.AbyssWindow.name)
                        AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.GOTO_EVENT, branch)
                      end
                    }, {})
                    return
                  end
                  OpenWindow(WinResConfig.CardPlotTalkWindow.name, nil, true, branch.step, branch)
                end
              end)
            elseif item.type == BRANCH_ITEM_TYPE.EMPTY_BRANCH then
              ChangeUIController(child, "c1", 3)
              local emptyBranchTips = T(20344)
              UIUtil.SetText(child, emptyBranchTips, "WordTxt")
            end
            child.alpha = 0
            PlayUITrans(gggcpm, "in", nil, k * 0.08)
          end
          
          list.numItems = count + 1 + lineCount
          targetHolder:TweenMove(targetPosition, 0.6)
          SetPlotItem(uis.Main.CardPlotDetails.DetailsTipsTitleAni.root, cardId, branches)
          PlayUITrans(uis.Main.CardPlotDetails.DetailsTipsTitleAni.DetailsTipsTitle.root, "up")
        else
        end
      end)
      
      function scheduleList.itemRenderer(j, ggcmp)
        local branch = branches[j + 1]
        local lighten = branch.finishTimestamp > 0 or branch.nextPlotNodeId > 0
        ChangeUIController(ggcmp, "c1", lighten and 1 or 0)
      end
      
      scheduleList.numItems = count
    else
      ChangeUIController(child, "c1", 0)
    end
  else
    if picHolder then
      picHolder:SetNativeObject(nil)
    end
    ChangeUIController(child, "c1", 1)
    UIUtil.SetText(child, T(20345), "WordTxt")
  end
end
local hasProcessing = function(branches)
  for _, branch in pairs(branches) do
    if branch.nextPlotNodeId > 0 and 0 == branch.finishTimestamp and not branch.suspend then
      return true
    end
  end
  return false
end
local hasTriggerable = function(branches)
  for _, branch in pairs(branches) do
    if 0 == branch.nextPlotNodeId and 0 == branch.finishTimestamp and not branch.suspend then
      return true
    end
  end
  return false
end
local RefreshPlotItems = function(filter)
  local list = uis.Main.CardPlotListRegion.CardAList
  list:RemoveChildrenToPool()
  local events = AbyssExploreData.GetAllEvents()
  table.clear(cardBranches)
  for _, v in pairs(events) do
    local e_type = v.type
    local insert = false
    if e_type == AbyssExploreEventID.BRANCH and filter(v) then
      insert = true
      local precondition = v.precondition
      if precondition then
        local flag = true
        for _, id in pairs(precondition) do
          if not AbyssExploreMgr.IsFinished(id) then
            flag = false
            break
          end
        end
        insert = flag
      end
    end
    if insert then
      local contains = false
      for i, entry in ipairs(cardBranches) do
        if entry.cardId == v.cardId then
          contains = i
          break
        end
      end
      local entry
      if not contains then
        entry = {
          cardId = v.cardId,
          branches = {}
        }
        table.insert(cardBranches, entry)
      else
        entry = cardBranches[contains]
      end
      table.insert(entry.branches, v)
    end
  end
  table.sort(cardBranches, function(x, y)
    local p0 = hasProcessing(x.branches)
    local p1 = hasProcessing(y.branches)
    local t0 = hasTriggerable(x.branches)
    local t1 = hasTriggerable(y.branches)
    if p0 == p1 then
      if p0 then
        return x.cardId > y.cardId
      elseif t0 == t1 then
        return x.cardId > y.cardId
      else
        return t0 and not t1
      end
    else
      return p0 and not p1
    end
  end)
  local flag = false
  for i, v in ipairs(cardBranches) do
    if hasProcessing(v.branches) then
      flag = i
      break
    end
  end
  ChangeUIController(uis.Main.CardPlotListRegion.root, "c2", flag and 1 or 0)
  UIUtil.SetText(uis.Main.CardPlotListRegion.root, T(20346), "WordTxt")
  hasInProgressBranch = flag
  local numItems = #cardBranches
  local defaultItem = "ui://Abyss/CardPlotListTipsAni"
  if 2 == selectedBranchIndex then
    numItems = numItems + 1
    defaultItem = "ui://Abyss/CardPlotListTipsAni1"
  end
  list.defaultItem = defaultItem
  list.numItems = numItems
end
local SelectBranch = function(index)
  selectedBranchIndex = index
  local branch = Branches[selectedBranchIndex]
  local list = uis.Main.CardPlotListRegion.TypeList
  list.selectedIndex = selectedBranchIndex - 1
  RefreshPlotItems(branch.filter)
  selectedIndex = -1
end

function CardPlotListWindow.ReInitData()
end

function CardPlotListWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.CardPlotListWindow.package, WinResConfig.CardPlotListWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetAbyss_CardPlotListWindowUis(contentPane)
    CardPlotListWindow.UpdateInfo()
    CardPlotListWindow.InitBtn()
  end)
end

function CardPlotListWindow.UpdateInfo()
  targetHolder = uis.Main.CardPlotDetails.DetailsTipsTitleAni.DetailsTipsTitle.PicHolder
  targetPosition = targetHolder.xy
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(TableData.GetConfig(11302, "BaseFeature").back_ground)
  CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.CardPlotListWindow.name, uis.Main.CurrencyReturn, nil, function()
    local ctrl = uis.Main.c1Ctr
    if 0 ~= ctrl.selectedIndex then
      local cardlist = uis.Main.CardPlotListRegion.CardAList
      for i = 1, cardlist.numItems do
        local child = cardlist:GetChildAt(i - 1):GetChildAt(0)
        local holder = child:GetChild("PicHolder")
        if holder then
          holder.visible = true
        end
      end
      ctrl.selectedIndex = 0
      selectedIndex = -1
      return
    end
    UIMgr:CloseWindow(WinResConfig.CardPlotListWindow.name)
  end)
  local list = uis.Main.CardPlotListRegion.CardAList
  list.itemRenderer = PlotItemRenderer
  list = uis.Main.CardPlotListRegion.TypeList
  
  function list.itemRenderer(i, gcmp)
    local index = i + 1
    local item = Branches[index]
    UIUtil.SetBtnText(gcmp, item.title, "NameTxt")
    gcmp.onClick:Set(function()
      if selectedBranchIndex == index then
        return
      end
      SelectBranch(index)
    end)
  end
  
  list.numItems = #Branches
  SelectBranch(1)
end

function CardPlotListWindow.InitBtn()
end

function CardPlotListWindow.OnClose()
  uis = nil
  contentPane = nil
end

return CardPlotListWindow
