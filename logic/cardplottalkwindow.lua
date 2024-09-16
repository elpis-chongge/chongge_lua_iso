require("Abyss_CardPlotTalkWindowByName")
local CardPlotTalkWindow = {}
local uis, contentPane, num, story_reader, eventInfo, callback, init, nodeConfs, reviewMode
local autoPlay = false
local autoPlayInitialInterval = 1
local autoPlayIntervalScale = 0.01
local autoPlayInterval, autoPlayElapse = 0, 0
local skip
local AutoPlay_Update = function()
  if story_reader then
    local cnt = story_reader.numItems()
    if cnt > 0 then
      local item = story_reader.getItem(cnt)
      if item.type == AbyssExploreStoryItemType.OPTION then
        return
      end
      local content
      if item.sub_items then
        item = item.sub_items[#item.sub_items]
      end
      content = item.config.remark()
      local len = string.len(content) / 3
      autoPlayInterval = autoPlayInitialInterval + len * autoPlayIntervalScale
    end
    autoPlayElapse = autoPlayElapse + Time.deltaTime
    if autoPlayElapse > autoPlayInterval then
      autoPlayElapse = 0
      story_reader.continue()
    end
  end
end
local EnableAutoPlay = function(enable)
  if enable == autoPlay then
    return
  end
  autoPlay = enable
  local main = uis.Main
  local panel = main.TalkTips
  local ctrl = main.TalkAutoBtn:GetController("c1")
  if autoPlay then
    if story_reader.iscomplete() then
      autoPlay = false
      return
    end
    autoPlayElapse = 0
    panel.NextStepBtn.visible = false
    ctrl.selectedIndex = 1
    UpdateManager.AddUpdateHandler(AutoPlay_Update)
  else
    panel.NextStepBtn.visible = true
    ctrl.selectedIndex = 0
    UpdateManager.RemoveUpdateHandler(AutoPlay_Update)
  end
end
local Complete = function()
  UIMgr:CloseWindow(WinResConfig.CardPlotTalkWindow.name)
  if callback then
    callback()
  end
end
local Skip = function()
  if not story_reader then
    return
  end
  skip = true
  EnableAutoPlay(false)
  local time = os.time()
  while not story_reader.iscomplete() do
    story_reader.continue()
    if os.time() - time > 1 then
      break
    end
  end
  Complete()
end
local UpdateGenericInfo = function(nodeConf)
  local nameText, descText, titleURL, timeText, addressText
  if nodeConf then
    nameText = nodeConf.name()
    descText = nodeConf.des()
    titleURL = nodeConf.title_icon
    timeText = nodeConf.vibe_des()
    addressText = nodeConf.vibe_address()
  end
  uis.Main.TalkTips.CardTitleShow.TitleLoader.url = UIUtil.GetResUrl(titleURL)
  uis.Main.TalkTips.TalkSummary.WordTxt.text = descText
  uis.Main.Weather.c1Ctr.selectedIndex = nodeConf.weather
  uis.Main.Weather.TimeTxt.text = timeText
  uis.Main.Weather.PlaceTxt.text = addressText
end
local GetAllNodesByEventId = function(eventId)
  local evtConf = TableData.GetConfig(eventId, "BaseManorEvent")
  local nodeConfTbl = TableData.GetTable("BaseManorNode")
  local result = {}
  for i, v in pairs(nodeConfTbl) do
    if v.group_id == tonumber(evtConf.parameter) then
      table.insert(result, v)
    end
  end
  table.sort(result, function(x, y)
    return x.id < y.id
  end)
  return result
end
local UpdatePanelStatus = function(is_complete, trigger_option, reader)
  local panel = uis.Main.TalkTips
  if is_complete then
    EnableAutoPlay(false)
    panel.c1Ctr.selectedIndex = 3
    UIUtil.SetBtnText(panel.EndChoiceBtn, T(20005), T(20008))
    PlayUITrans(panel.EndChoiceBtn, "in", function()
      panel.EndChoiceBtn.onClick:Set(Complete)
    end)
  elseif trigger_option then
    panel.c1Ctr.selectedIndex = 2
    AbyssExploreStoryUtils.SetExternalOptions(trigger_option, uis.Main.TalkTips.ChoiceList, reader, true)
  else
    panel.c1Ctr.selectedIndex = 1
    panel.NextStepBtn.onClick:Set(reader.continue)
    UIUtil.SetBtnText(panel.NextStepBtn, T(20257), T(20079))
  end
end
local UpdateTalklist = function(numItems)
  if not init then
    return
  end
  if not story_reader then
    return
  end
  local list = uis.Main.TalkList
  list.scrollPane.ignoreItemContainer = list.scrollPane.isBottomMost
  story_reader.setplayanim(true)
  list.numItems = numItems
  story_reader.setplayanim(false)
  if numItems > 0 then
    list.scrollPane:ScrollBottom(true)
  end
end
local UpdatePlotTalkList = function(nodeIndex, ani)
  EnableAutoPlay(false)
  local records, reader
  local nodeConf = nodeConfs[nodeIndex]
  UpdateGenericInfo(nodeConf)
  local panel = uis.Main.TalkTips
  local list = uis.Main.TalkList
  local progress = panel.TalkProgress
  progress.Progress1Txt.text = string.format("%02d", nodeIndex)
  progress.Progress2Txt.text = string.format("%02d", eventInfo.numNodes)
  local nodeStoryRecords = eventInfo.nodeStoryRecords
  local inProgress = eventInfo.nextPlotNodeId == nodeConf.id and 0 == eventInfo.finishTimestamp
  if nodeStoryRecords then
    for _, v in pairs(nodeStoryRecords) do
      if v.nodeId == nodeConf.id then
        records = v.storyRecords
        break
      end
    end
  end
  if inProgress and not records then
    records = eventInfo.storyRecords
  end
  local localtest = eventInfo.localtest
  local records_len = records and #records or 0
  local storyId = tonumber(nodeConf.parameter)
  list.defaultItem = "ui://Abyss/TalkWordAni"
  local oncontinue
  if inProgress then
    function oncontinue(story_id, progress_cnt, story_items, trigger_option, is_complete)
      local numItems = #story_items
      
      local review = progress_cnt <= records_len
      local conf = TableData.GetConfig(story_id, "BaseStorySimple")
      if not skip then
        if not review then
          if not localtest then
            if conf.type == AbyssExploreStoryItemType.BATTLE then
              AbyssExploreMgr.PrepareEnterBattle(eventInfo, conf.stage_id, conf.id)
              return
            end
            story_reader.wait(true)
            AbyssExploreMgr.ProcessEventStory(eventInfo, story_id, function()
              if story_reader then
                story_reader.wait(false)
                UpdateTalklist(numItems)
                UpdatePanelStatus(is_complete, trigger_option, story_reader)
              end
            end)
            return
          else
            if conf.type == AbyssExploreStoryItemType.BATTLE then
              AbyssExploreMgr.PrepareEnterBattle(eventInfo, conf.stage_id, conf.id)
              return
            end
            table.insert(eventInfo.storyRecords, story_id)
          end
        end
        UpdatePanelStatus(is_complete, trigger_option, story_reader)
        UpdateTalklist(numItems)
      else
        eventInfo.storyRecords = eventInfo.storyRecords or {}
        local storyRecords = eventInfo.storyRecords
        local cnt = #storyRecords
        if cnt > 0 then
          local prev = storyRecords[cnt]
          local prevConf = TableData.GetConfig(prev, "BaseStorySimple")
          if prevConf.type == AbyssExploreStoryItemType.OPTION then
            local flag = false
            for _, v in ipairs(prevConf.option_next) do
              if tonumber(v) == story_id then
                flag = true
                break
              end
            end
            if flag then
              eventInfo.optionRecords = eventInfo.optionRecords or {}
              local optionRecords = eventInfo.optionRecords
              table.insert(optionRecords, story_id)
            end
          end
        end
        table.insert(storyRecords, story_id)
        if trigger_option then
          local n = #conf.option_next
          local next_id = tonumber(conf.option_next[math.random(1, n)])
          story_reader.continue(next_id)
        end
      end
    end
    
    uis.Main.TalkAutoBtn.visible = true
    uis.Main.TalkSkipBtn.visible = true
  else
    uis.Main.TalkAutoBtn.visible = false
    uis.Main.TalkSkipBtn.visible = false
    panel.c1Ctr.selectedIndex = 0
  end
  reader = AbyssExploreStoryUtils.CreateStoryReader(storyId, oncontinue, nil, records, AbyssExploreStoryType.Branch)
  if inProgress then
    init = false
    story_reader = reader
  else
    if story_reader then
      story_reader.release()
    end
    story_reader = nil
  end
  
  function reader.getOptionDes(conf, i)
    if localtest then
      return conf.option_des[i + 1]
    end
    local op_index = eventInfo.storyOptions[conf.id][i + 1] + 1
    return conf.option_des[op_index]
  end
  
  function reader.getOptionNext(conf, i)
    if localtest then
      return conf.option_next[i + 1]
    end
    local op_index = eventInfo.storyOptions[conf.id][i + 1] + 1
    return conf.option_next[op_index]
  end
  
  list.itemRenderer = reader.renderer
  list.itemProvider = reader.provider
  list:SetVirtual()
  if inProgress then
    if records_len > 0 then
      for _ = 1, records_len do
        reader.continue()
      end
      local numItems = reader.numItems()
      list.numItems = numItems
      init = true
      if numItems > 0 then
        list.scrollPane:ScrollBottom(false)
      end
    else
      init = true
      reader.continue()
    end
  else
    if records then
      for _ = 1, #records do
        reader.continue()
      end
    end
    list.numItems = reader.numItems()
    list.scrollPane:ScrollTop()
  end
end
local UpdateLeftTabPosition = function()
  local tablist = uis.Main.TabRegion.TabList
  local parentPos = tablist.container.position
  local selectedIndex = tablist.selectedIndex
  if selectedIndex and selectedIndex >= 0 then
    local child = tablist:GetChildAt(selectedIndex)
    local childHeight = child.height
    local lineGap = tablist.lineGap
    local posY = selectedIndex * (childHeight + lineGap)
    local fadeHeight = 28
    local upPosY = posY - lineGap - childHeight + parentPos.y
    local downPosY = posY + parentPos.y + lineGap + childHeight * 2
    local containerHeight = tablist.size.y
    local scrollpane = tablist.scrollPane
    local scrollpaneY = scrollpane.posY
    if fadeHeight > upPosY and selectedIndex >= 0 then
      scrollpane:SetPosY(scrollpaneY + upPosY, true)
    elseif downPosY > containerHeight - fadeHeight then
      local delta = downPosY - containerHeight
      scrollpane:SetPosY(scrollpaneY + delta, true)
    end
  end
end
local sureBtnParam = {
  touchCallback = function()
    if not AbyssExploreMgr or not AbyssExploreMgr.Exists() then
      ld("AbyssExplore")
      local eventId = eventInfo.eventId
      AbyssExploreMgr.Enter(EXPLORE_MAP_ID.ABYSS, function()
        AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.GOTO_EVENT, eventId)
      end, true)
      return
    end
    JumpToWindow(WinResConfig.AbyssWindow.name)
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.GOTO_EVENT, eventInfo)
  end
}
local cancelBtnParam = {}
local LeftTabItemRenderer = function(i, gcmp)
  local nodeIndex = i + 1
  local nodeConf = nodeConfs[nodeIndex]
  local name = type(nodeConf.name) == "function" and nodeConf.name() or "未配置" .. tostring(nodeConf.id)
  UIUtil.SetText(gcmp, name, "WordTxt")
  local step = eventInfo.step
  local inProgress = i == step
  ChangeUIController(gcmp, "c1", inProgress and 1 or 0)
  UIUtil.SetText(gcmp:GetChild("Sign"), T(20305), "WordTxt")
  gcmp.onClick:Set(function()
    if i < step then
      local index
      for j, v in ipairs(eventInfo.nodeStoryRecords) do
        if v.nodeId == nodeConf.id then
          index = j
          break
        end
      end
      UpdatePlotTalkList(index)
      uis.Main.TabRegion.TabList.selectedIndex = i
      UpdateLeftTabPosition()
    elseif inProgress then
      if reviewMode then
        local content = T(20215, name)
        MessageBox.Show(content, sureBtnParam, cancelBtnParam)
      else
        UpdatePlotTalkList(i + 1)
        uis.Main.TabRegion.TabList.selectedIndex = i
        UpdateLeftTabPosition()
      end
    else
      FloatTipsUtil.ShowWarnTips(T(20074))
    end
  end)
end
local InitPanelInfo = function(nodeIndex)
  local tab = uis.Main.TabRegion
  nodeConfs = GetAllNodesByEventId(eventInfo.eventId)
  local tablist = tab.TabList
  tablist.itemRenderer = LeftTabItemRenderer
  tablist.numItems = math.min(#nodeConfs, eventInfo.step + 1)
  if not reviewMode then
    for i, v in ipairs(nodeConfs) do
      if v.id == eventInfo.nextPlotNodeId then
        nodeIndex = i
        break
      end
    end
    UpdatePlotTalkList(nodeIndex)
    tablist.selectedIndex = nodeIndex - 1
  else
    UpdatePlotTalkList(nodeIndex)
    tablist.selectedIndex = nodeIndex - 1
  end
  UpdateLeftTabPosition()
end

function CardPlotTalkWindow.ReInitData()
end

function CardPlotTalkWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.CardPlotTalkWindow.package, WinResConfig.CardPlotTalkWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetAbyss_CardPlotTalkWindowUis(contentPane)
    init = false
    reviewMode = bridgeObj.argTable[1]
    num = bridgeObj.argTable[2]
    eventInfo = bridgeObj.argTable[3]
    callback = bridgeObj.argTable[4]
    CardPlotTalkWindow.UpdateInfo()
    CardPlotTalkWindow.InitBtn()
  end)
end

function CardPlotTalkWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://UIBackGround/AbyssCardDialog_1000"
  if eventInfo.localtest then
    nodeConfs = {
      TableData.GetConfig(eventInfo.nextPlotNodeId, "BaseManorNode")
    }
    UpdatePlotTalkList(1)
    return
  end
  UIUtil.SetText(uis.Main.TalkAutoBtn, T(20351))
  UIUtil.SetText(uis.Main.TalkSkipBtn, T(20519))
  local ctrl = uis.Main.TalkAutoBtn:GetController("c1")
  ctrl.onChanged:Set(function()
    if 1 == ctrl.selectedIndex then
      UIUtil.SetText(uis.Main.TalkAutoBtn, T(20350))
    else
      UIUtil.SetText(uis.Main.TalkAutoBtn, T(20351))
    end
  end)
  if reviewMode then
    InitPanelInfo(num)
  else
    InitPanelInfo()
  end
end

function CardPlotTalkWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.CardPlotTalkWindow.name)
  end)
  uis.Main.TalkAutoBtn.onClick:Set(function()
    EnableAutoPlay(not autoPlay)
  end)
  uis.Main.TalkSkipBtn.onClick:Set(function()
    Skip()
  end)
end

function CardPlotTalkWindow.OnShown()
  AbyssExploreMgr.EnableGestureOp(false)
  if UIMgr:IsShowFromHide(WinResConfig.CardPlotTalkWindow.name) then
    local list = uis.Main.TalkList
    local numItems = story_reader.numItems()
    list.numItems = numItems
    if numItems > 0 then
      list.scrollPane:ScrollBottom(true)
    end
  end
end

function CardPlotTalkWindow.OnHide()
  AbyssExploreMgr.EnableGestureOp(true)
end

function CardPlotTalkWindow.OnClose()
  EnableAutoPlay(false)
  uis = nil
  contentPane = nil
  if story_reader then
    story_reader.release()
  end
  init = nil
  num = nil
  callback = nil
  eventInfo = nil
  story_reader = nil
  skip = nil
end

function CardPlotTalkWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.CardPlotTalkWindow.CONTINUE and story_reader then
    story_reader.continue()
  end
end

return CardPlotTalkWindow
