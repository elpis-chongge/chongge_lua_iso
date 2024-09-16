require("Abyss_RandomTipsWindowByName")
local RandomTipsWindow = {}
local uis, contentPane, storyId, eventInfo, callback

function RandomTipsWindow.ReInitData()
end

function RandomTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RandomTipsWindow.package, WinResConfig.RandomTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetAbyss_RandomTipsWindowUis(contentPane)
    storyId = bridgeObj.argTable[1]
    eventInfo = bridgeObj.argTable[2]
    callback = bridgeObj.argTable[3]
    RandomTipsWindow.UpdateInfo()
    RandomTipsWindow.InitBtn()
  end)
end

local story_reader, init, complete
local UpdateTalklist = function(numItems)
  local list = uis.Main.TalkList
  list.scrollPane.ignoreItemContainer = list.scrollPane.isBottomMost
  list.numItems = numItems
  if numItems > 0 then
    list.scrollPane:ScrollBottom(true)
  end
end
local UpdatePanelStatus = function(is_complete, trigger_option, reader)
  local panel = uis.Main
  if is_complete then
    panel.c1Ctr.selectedIndex = 3
    UIUtil.SetBtnText(panel.EndChoiceBtn, T(20005), T(20008))
    PlayUITrans(panel.EndChoiceBtn, "in")
    panel.EndChoiceBtn.onClick:Set(function()
      UIMgr:CloseWindow(WinResConfig.RandomTipsWindow.name)
      if callback then
        callback()
      end
    end)
  elseif trigger_option then
    panel.c1Ctr.selectedIndex = 2
    AbyssExploreStoryUtils.SetExternalOptions(trigger_option, panel.ChoiceList, story_reader, true, "ui://Abyss/RandomChoiceAni", "in", nil, 1.3333)
  else
    panel.c1Ctr.selectedIndex = 1
    panel.NextStepBtn.onClick:Set(reader.continue)
    UIUtil.SetBtnText(panel.NextStepBtn, T(20257), T(20079))
  end
end

function RandomTipsWindow.UpdateInfo()
  init = false
  complete = false
  local localtest = eventInfo.localtest
  local config = TableData.GetConfig(eventInfo.eventId, "BaseManorEvent")
  local nameText
  if localtest then
    config = {}
  end
  if type(config.name) == "function" then
    nameText = config.name()
  else
    nameText = string.format("未配置%s", config.id)
  end
  uis.Main.NameTxt.text = nameText
  uis.Main.PicLoader.url = UIUtil.GetResUrl(config.bg_res)
  local records = eventInfo.storyRecords
  local records_len = records and #records or 0
  story_reader = AbyssExploreStoryUtils.CreateStoryReader(storyId, function(story_id, progress_cnt, story_items, trigger_option, is_complete)
    local numItems = #story_items
    local item = story_items[numItems]
    local review = false
    local storyRecords = eventInfo.storyRecords
    if storyRecords then
      review = story_id == storyRecords[progress_cnt]
    end
    if not review then
      if not localtest then
        if item.type == AbyssExploreStoryItemType.BATTLE then
          AbyssExploreMgr.PrepareEnterBattle(eventInfo, item.config.stage_id, story_id)
          return
        end
        story_reader.wait(true)
        AbyssExploreMgr.ProcessEventStory(eventInfo, story_id, function()
          story_reader.wait(false)
          if not init then
            return
          end
          UpdateTalklist(numItems)
          UpdatePanelStatus(is_complete, trigger_option, story_reader)
        end)
        return
      else
        if item.type == AbyssExploreStoryItemType.BATTLE then
          AbyssExploreMgr.PrepareEnterBattle(eventInfo, item.config.stage_id, story_id, nil, true)
          return
        end
        table.insert(eventInfo.storyRecords, story_id)
      end
    end
    UpdateTalklist(numItems)
    UpdatePanelStatus(is_complete, trigger_option, story_reader)
  end, nil, records, AbyssExploreStoryType.Random_Building)
  
  function story_reader.getOptionDes(conf, i)
    if localtest then
      return conf.option_des[i + 1]
    end
    local id = conf.id
    local options = eventInfo.storyOptions[id]
    local index = options[i + 1]
    local op_index = index + 1
    return conf.option_des[op_index]
  end
  
  function story_reader.getOptionNext(conf, i)
    if localtest then
      return conf.option_next[i + 1]
    end
    local id = conf.id
    local options = eventInfo.storyOptions[id]
    local index = options[i + 1]
    local op_index = index + 1
    return conf.option_next[op_index]
  end
  
  local list = uis.Main.TalkList
  list.defaultItem = "ui://Abyss/TalkLeftAni"
  list.itemProvider = story_reader.provider
  list.itemRenderer = story_reader.renderer
  list:SetVirtual()
  init = true
  story_reader.setplayanim(false)
  if records_len > 0 then
    for _ = 1, records_len do
      story_reader.continue()
    end
    local numItems = story_reader.numItems()
    list.numItems = numItems
    if numItems > 0 then
      list.scrollPane:ScrollBottom()
    end
  else
    story_reader.continue()
  end
  story_reader.setplayanim(true)
  local splits = Split(TableData.GetConfig(70010815, "BaseFixed").array_value, "|")
  for i = 1, #splits do
    splits[i] = tonumber(splits[i])
  end
  UIUtil.InitAssetsTips(uis.AssetsTipsGroup.AssetsTipsList, splits)
end

function RandomTipsWindow.InitBtn()
  uis.CloseBtn.onClick:Set(function()
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.EVENT_WIN_CLOSE, eventInfo)
    UIMgr:CloseWindow(WinResConfig.RandomTipsWindow.name)
  end)
end

function RandomTipsWindow.OnShown()
  if UIMgr:IsShowFromHide(WinResConfig.RandomTipsWindow.name) then
    local list = uis.Main.TalkList
    local numItems = story_reader.numItems()
    list.numItems = numItems
    if numItems > 0 then
      list.scrollPane:ScrollBottom(true)
    end
  end
end

function RandomTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  if story_reader then
    story_reader.release()
  end
  init = nil
  storyId = nil
  complete = nil
  callback = nil
  eventInfo = nil
  story_reader = nil
end

return RandomTipsWindow
