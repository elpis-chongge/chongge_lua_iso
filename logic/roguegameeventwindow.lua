require("RogueBuild01_InsidePlotEventWindowByName")
local RogueGameEventWindow = {}
local uis, contentPane, rogueNode, callback, story_reader, currentTypingEffect
local typingInterval = 0.05
local typingSpeedUpInterval = 0.001
local tweenId
local IsTriggerKeyStep = function(storyConf)
  local trigger = false
  if storyConf and type(storyConf.option_condition) == "string" then
    local splits = Split(storyConf.option_condition, "|")
    local optionType = tonumber(splits[1])
    if optionType == RogueGameStoryOptionType.ANY_HP_REDUCE_PERC_N then
      local val = tonumber(splits[2])
      trigger = false
      local cardInfoList = RogueGameData.GetCardInfoList()
      for _, v in pairs(cardInfoList) do
        local info = v.info
        local attrMap = info.attributes
        local hp = attrMap[CardAttribute.GetIdByName(ATTR_ENUM.hp)]
        local max_hp = attrMap[CardAttribute.GetIdByName(ATTR_ENUM.max_hp)]
        if hp / max_hp >= math.abs(val / 10000) then
          trigger = true
          break
        end
      end
    elseif optionType == RogueGameStoryOptionType.ALL_HP_REDUCE_PERC_N then
      local val = tonumber(splits[2])
      trigger = true
      local cardInfoList = RogueGameData.GetCardInfoList()
      for _, v in pairs(cardInfoList) do
        local info = v.info
        local attrMap = info.attributes
        local hp = attrMap[CardAttribute.GetIdByName(ATTR_ENUM.hp)]
        local max_hp = attrMap[CardAttribute.GetIdByName(ATTR_ENUM.max_hp)]
        if hp / max_hp < math.abs(val / 10000) then
          trigger = false
          break
        end
      end
    elseif optionType == RogueGameStoryOptionType.CONSUME_ITEM then
      trigger = true
      for k = 2, #splits do
        local subsplits = Split(splits[k], ":")
        local itemId, count = tonumber(subsplits[2]), tonumber(subsplits[3])
        local ownedCount = ActorData.GetItemCount(itemId)
        if count > ownedCount then
          trigger = false
          break
        end
      end
    end
  end
  return trigger
end
local UpdatePanelStatus = function(is_complete, trigger_option)
  local panel = uis.Main
  if is_complete then
    UIUtil.SetBtnText(panel.NextBtn, T(20005))
    panel.c1Ctr.selectedIndex = 3
    panel.NextBtn.onClick:Set(function()
      if callback then
        callback()
      end
    end)
  elseif trigger_option then
    panel.c1Ctr.selectedIndex = 2
    local stageId = rogueNode.stageId
    local option_next = trigger_option.config.option_next
    local selectedIndex
    for i, v in ipairs(option_next) do
      local conf = TableData.GetConfig(tonumber(v), "BaseStorySimple")
      if conf.stage_id == stageId then
        selectedIndex = i
        break
      end
    end
    RogueGameStoryUtils.SetExternalOptions(trigger_option, panel.OptionList, story_reader, true, "ui://RogueBuild01/PlotEvent_OptionAni", "up", selectedIndex)
  else
    local stageId = rogueNode.stageId
    if type(stageId) == "number" and stageId > 0 then
      story_reader.continue()
    else
      panel.c1Ctr.selectedIndex = 1
      panel.NextBtn.onClick:Set(story_reader.continue)
      UIUtil.SetBtnText(panel.NextBtn, T(20257))
    end
  end
end
local RenderStoryItem = function(index, is_complete, trigger_option, trigger_event)
  if index > 0 and index <= story_reader.numItems() then
    local panel = uis.Main
    local story_item, gcmp = story_reader.renderer(index - 1, uis.Main.root, trigger_event)
    local st_type = story_item.type
    if st_type == RogueGameStoryItemType.DIALOGUE or st_type == RogueGameStoryItemType.VOICEOVER or st_type == RogueGameStoryItemType.BATTLE_TEXT then
      panel.c1Ctr.selectedIndex = 0
      local container = gcmp:GetChild("Word")
      local wordTxt = container:GetChild("WordTxt")
      if currentTypingEffect then
        currentTypingEffect:Cancel()
      end
      currentTypingEffect = FairyGUI.TypingEffect(wordTxt)
      currentTypingEffect:Start()
      currentTypingEffect:PrintAll(typingInterval)
      
      function currentTypingEffect.effectEndAction()
        currentTypingEffect:Cancel()
        currentTypingEffect = nil
        UpdatePanelStatus(is_complete, trigger_option)
      end
      
      return
    end
  end
end
local params = {
  stageId = -1,
  sceneType = ProtoEnum.SCENE_TYPE.ROGUE,
  backFunc = function()
    UIMgr:CloseWindow(WinResConfig.FormationWindow.name)
    OpenWindow(WinResConfig.RogueGameEventWindow.name, nil, RogueGameData.GetChapterInfo().curNode, callback)
  end
}
local PREFIX = "Assets/Art/TextureSingle/RogueBg"
local Init = function()
  local eventId = rogueNode.eventId
  local latestStoryId = rogueNode.eventStoryId
  local conf = TableData.GetConfig(eventId, "BaseRogueEvent")
  local start_story_id = conf.story_id
  local storyId = latestStoryId > 0 and latestStoryId or start_story_id
  local path = conf.back_ground
  if not string.find(path, PREFIX) then
    path = string.format("%s/%s", PREFIX, path)
  end
  local texture = ResourceManager.LoadTexture(path)
  UIUtil.SetLoaderTexture(uis.Main.PicLoader, texture)
  local nameText, descText, titleText
  if type(conf.name) == "function" then
    nameText = conf.name()
  else
    nameText = string.format("未配置%s", conf.id)
  end
  if "function" == type(conf.des_detail) then
    descText = conf.des_detail()
  else
    descText = string.format("未配置%s", conf.id)
  end
  if "function" == type(conf.des_title) then
    titleText = conf.des_title()
  else
    titleText = string.format("未配置%s", conf.id)
  end
  uis.Main.Word.TitleTxt.text = titleText
  uis.Main.Word.WordTxt.text = descText
  RogueGameMgr.UI_SetCommonBottomInfo(uis.Main.Botton.root)
  RogueGameMgr.UI_SetAssetList(uis.Main.AssetsList)
  story_reader = RogueGameStoryUtils.CreateStoryReader(storyId, function(story_id, progress_cnt, story_items, trigger_option, is_complete)
    local numItems = #story_items
    local storyConf = TableData.GetConfig(story_id, "BaseStorySimple")
    local review = latestStoryId == story_id
    if storyConf then
      if storyConf.type == RogueGameStoryItemType.BATTLE then
        params.stageId = storyConf.stage_id
        ld("Formation")
        story_reader.wait(true)
        local prevStoryId = story_items[numItems - 1].id
        RogueGameService.ChooseRogueEventBattleStoryReq(eventId, story_id, prevStoryId, function(msg)
          story_reader.wait(false)
          FormationMgr.TryOpenFormationWindow(params)
        end)
        return
      end
      if (IsTriggerKeyStep(storyConf) or type(storyConf.key_tag) == "number" and 1 == storyConf.key_tag) and not review then
        story_reader.wait(true)
        RogueGameService.FinishRogueEventKeyStepReq(eventId, story_id, function()
          story_reader.wait(false)
          local node = RogueGameData.GetChapterInfo().curNode
          local trigger_event = node.eventRandTreasure > 0
          if trigger_option then
            UpdatePanelStatus(is_complete, trigger_option)
          else
            RenderStoryItem(numItems, is_complete, trigger_option, trigger_event)
          end
        end)
        return
      end
    end
    if trigger_option then
      UpdatePanelStatus(is_complete, trigger_option)
    elseif review then
      local node = RogueGameData.GetChapterInfo().curNode
      local trigger_event = node.eventRandTreasure > 0
      RenderStoryItem(numItems, is_complete, trigger_option, trigger_event)
    else
      RenderStoryItem(numItems, is_complete, trigger_option)
    end
  end)
  story_reader.continue()
end

function RogueGameEventWindow.ReInitData()
end

function RogueGameEventWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameEventWindow.package, WinResConfig.RogueGameEventWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_InsidePlotEventWindowUis(contentPane)
    rogueNode = bridgeObj.argTable[1]
    callback = bridgeObj.argTable[2]
    RogueGameEventWindow.UpdateInfo()
    RogueGameEventWindow.InitBtn()
  end)
end

function RogueGameEventWindow.UpdateInfo()
  Init()
end

function RogueGameEventWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.RogueGameEventWindow.name)
  end)
  uis.Main.TouchScreenBtn.soundFmod = nil
  uis.Main.TouchScreenBtn.onClick:Set(function(context)
    if context.inputEvent.isDoubleClick and currentTypingEffect then
      currentTypingEffect:PrintAll(typingSpeedUpInterval, 4)
    end
  end)
end

function RogueGameEventWindow.OnShown()
  if currentTypingEffect then
    currentTypingEffect:Resume()
  end
end

function RogueGameEventWindow.OnHide()
  if currentTypingEffect then
    currentTypingEffect:Pause()
  end
end

function RogueGameEventWindow.OnClose()
  uis = nil
  contentPane = nil
  if story_reader then
    story_reader.release()
  end
  story_reader = nil
  if tweenId then
    LeanTween.cancel(tweenId)
  end
  tweenId = nil
  if currentTypingEffect then
    currentTypingEffect:Cancel()
  end
  currentTypingEffect = nil
end

function RogueGameEventWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_ITEM_CHANGE then
    uis.Main.AssetsList.numItems = 2
  elseif msgId == WindowMsgEnum.RogueGame.REFRESH_EVENT_PANEL_INFO then
    RogueGameMgr.UI_SetCommonBottomInfo(uis.Main.Botton.root)
  end
end

return RogueGameEventWindow
