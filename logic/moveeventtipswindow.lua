require("Abyss_MoveEventTipsWindowByName")
local MoveEventTipsWindow = {}
local uis, contentPane, storyId, eventInfo, callback

function MoveEventTipsWindow.ReInitData()
end

function MoveEventTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.MoveEventTipsWindow.package, WinResConfig.MoveEventTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetAbyss_MoveEventTipsWindowUis(contentPane)
    storyId = bridgeObj.argTable[1]
    eventInfo = bridgeObj.argTable[2]
    callback = bridgeObj.argTable[3]
    MoveEventTipsWindow.UpdateInfo()
    MoveEventTipsWindow.InitBtn()
  end)
end

local story_reader, current_index, init, complete
local ItemProvider = function(_)
  return story_reader.provider(current_index - 1)
end
local ItemRenderer = function(_, gcmp)
  story_reader.renderer(current_index - 1, gcmp)
end
local UpdateDialogue = function()
  if not init then
    return
  end
  local item = story_reader.getItem(current_index)
  if item then
    if item.type ~= AbyssExploreStoryItemType.OPTION then
      local list = uis.Main.ModuleList
      list:RemoveChildrenToPool()
      list.numItems = 1
    else
      ItemRenderer(current_index, uis.Main.root)
    end
  end
end
local UpdatePanelStatus = function(is_complete, trigger_option, reader)
  local panel = uis.Main
  if is_complete then
    panel.c3Ctr.selectedIndex = 3
    UIUtil.SetBtnText(panel.EndChoiceBtn, T(20005), T(20008))
    PlayUITrans(panel.EndChoiceBtn, "in")
    panel.EndChoiceBtn.onClick:Set(function()
      UIMgr:CloseWindow(WinResConfig.MoveEventTipsWindow.name)
      if callback then
        callback()
      end
    end)
  elseif trigger_option then
    panel.c3Ctr.selectedIndex = 2
    AbyssExploreStoryUtils.SetExternalOptions(trigger_option, panel.ChoiceList, story_reader, true, "ui://Abyss/MoveChoiceAni", "in", "out")
  else
    panel.c3Ctr.selectedIndex = 1
    panel.NextStepBtn.onClick:Set(reader.continue)
    UIUtil.SetBtnText(panel.NextStepBtn, T(20446), T(20079))
  end
end

function MoveEventTipsWindow.UpdateInfo()
  init = false
  complete = false
  local config = TableData.GetConfig(eventInfo.eventId, "BaseManorEvent")
  local nameText
  if type(config) == "table" then
    if type(config.name) == "function" then
      nameText = config.name()
    else
      nameText = string.format("未配置%s", config.id)
    end
  end
  uis.Main.NameTxt.text = nameText
  local records = eventInfo.storyRecords
  local records_len = records and #records or 0
  local localtest = eventInfo.localtest
  story_reader = AbyssExploreStoryUtils.CreateStoryReader(storyId, function(story_id, progress_cnt, story_items, trigger_option, is_complete)
    local num = #story_items
    local item = story_items[num]
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
          if story_reader then
            story_reader.wait(false)
            if not init then
              return
            end
            current_index = num
            UpdateDialogue()
            UpdatePanelStatus(is_complete, trigger_option, story_reader)
          end
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
    current_index = num
    UpdateDialogue()
    UpdatePanelStatus(is_complete, trigger_option, story_reader)
  end, nil, records, AbyssExploreStoryType.Random_Moving)
  
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
  
  current_index = 0
  local list = uis.Main.ModuleList
  list.itemProvider = ItemProvider
  list.itemRenderer = ItemRenderer
  init = true
  story_reader.setplayanim(false)
  if records_len > 0 then
    for _ = 1, records_len do
      story_reader.continue()
      UpdateDialogue()
    end
  else
    story_reader.continue()
  end
  story_reader.setplayanim(true)
  if eventInfo.eventId == 76201012 then
    uis.c1Ctr.selectedIndex = 1
  else
    uis.c1Ctr.selectedIndex = 0
  end
end

function MoveEventTipsWindow.InitBtn()
  uis.CloseBtn.onClick:Set(function()
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.EVENT_WIN_CLOSE, eventInfo)
    UIMgr:CloseWindow(WinResConfig.MoveEventTipsWindow.name)
  end)
  uis.SkipBtn.onClick:Set(function()
    AbyssExploreService.StorySkipReq(eventInfo.eventId)
    UIMgr:CloseWindow(WinResConfig.MoveEventTipsWindow.name)
  end)
  UIUtil.SetBtnText(uis.Main.NextStepBtn, T(20078), T(20079))
end

function MoveEventTipsWindow.OnShown()
  if UIMgr:IsShowFromHide(WinResConfig.MoveEventTipsWindow.name) then
    if eventInfo.storyRecords then
      current_index = #eventInfo.storyRecords
    end
    UpdateDialogue()
  end
end

function MoveEventTipsWindow.OnClose()
  init = false
  uis = nil
  contentPane = nil
  if story_reader then
    story_reader.release()
  end
  story_reader = nil
end

return MoveEventTipsWindow
