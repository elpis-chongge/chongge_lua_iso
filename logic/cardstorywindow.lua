CardStoryWindow = {}
local uis, voiceData, lastItem
local tempMoveEffect = {}
local tween, animTween, timeDown, soundEventInstance
local animTime = 0.25
local effectObj = {}

function CardStoryWindow.Open(_uis)
  uis = _uis
  uis.c1Ctr.selectedIndex = 1
  lastItem = nil
  uis.VoiceWord.root.visible = false
  PlayUITrans(uis.root, "Story")
  CardStoryWindow.UpdateTextDisplay()
  CardStoryWindow.OnInit()
end

function CardStoryWindow.UpdateTextDisplay()
  UIUtil.SetBtnText(uis.Cultivate2Btn, T(97), T(98))
  UIUtil.SetBtnText(uis.Cultivate1Btn, T(95), T(96))
  uis.Voice.StoryTitle.NameTxt.text = T(908)
  uis.Voice.StoryTitle.SubtitleTxt.text = T(909)
  if CardMgr.cardConfigData.cv_name then
    local wordConfigName = "BaseCvNameCn"
    if Language.curLanguage == "cn" then
      wordConfigName = "BaseCvNameCn"
    elseif Language.curLanguage == "jp" then
      wordConfigName = "BaseCvNameJp"
    elseif Language.curLanguage == "en" then
      wordConfigName = "BaseCvNameEn"
    end
    local cvData = TableData.GetConfig(CardMgr.cardConfigData.cv_name, wordConfigName)
    if cvData and Language.curLanguageVoice then
      local nameStr = cvData["name_" .. Language.curLanguageVoice]
      if nameStr then
        uis.CV.CvTxt.text = T(1336, nameStr)
      end
    end
  end
  RedDotMgr.AddNode({
    windowName = WinResConfig.CardDetailsWindow.name,
    com = uis.Cultivate2Btn,
    visibleFunc = function()
      return RedDotCard.CanVoice(CardMgr.cardId)
    end,
    dataType = RED_DOT_DATA_TYPE.CARD
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.CardDetailsWindow.name,
    com = uis.Cultivate1Btn,
    visibleFunc = function()
      return RedDotCard.CanStory(CardMgr.cardId)
    end,
    dataType = RED_DOT_DATA_TYPE.CARD
  })
end

function CardStoryWindow.InitBaseTips()
  local title, tips
  tips = UIMgr:CreateObject("Card", "DataModular1")
  title = tips:GetChild("StoryTitle")
  UIUtil.SetBtnText(title, T(99), T(200))
  local height = 0
  local list = tips:GetChild("DataList")
  local item
  for i = 1, 3 do
    item = UIMgr:CreateObject("Card", "StoryData1")
    item:GetChild("Word1Txt").text = T(201 + i)
    if CardMgr.cardConfigData["information" .. i] then
      item:GetChild("Word2Txt").text = CardMgr.cardConfigData["information" .. i]()
    end
    height = height + item.height
    list:AddChild(item)
  end
  list:SetSize(list.width, height)
  uis.Story.StoryList:AddChild(tips)
end

local GetConfigData = function(strTb)
  local itemList = {}
  if strTb then
    for i = 1, #strTb do
      local addAttr = Split(strTb[i], ":")
      table.insert(itemList, {
        id = tonumber(addAttr[1]),
        lockLv = tonumber(addAttr[2]),
        nameWordId = addAttr[3] and tonumber(addAttr[3]) or nil
      })
    end
  end
  return itemList
end

function CardStoryWindow.InitStoryTips()
  local tb = GetConfigData(CardMgr.cardConfigData.story_ids, true)
  local newTb = {}
  local s
  for i, v in ipairs(tb) do
    s = T(v.id)
    if nil ~= s and " " ~= s and "" ~= s then
      table.insert(newTb, v)
    end
  end
  table.sort(newTb, function(a, b)
    return a.lockLv < b.lockLv
  end)
  local obj, storyTitle, lastWord, maxHeight, lastAnimObj
  local height = 0
  local titleTxt = {
    {
      n = T(860),
      s = T(861),
      id = 85010001
    },
    {
      n = T(862),
      s = T(863),
      id = 85010002
    },
    {
      n = T(864),
      s = T(865),
      id = 85010003
    },
    {
      n = T(866),
      s = T(867),
      id = 85010004
    }
  }
  for i, v in pairs(newTb) do
    local txtTb = titleTxt[v.lockLv + 1]
    if CardMgr.cardInfoData.quality >= v.lockLv then
      obj = UIMgr:CreateObject("Card", "DataModular2_Open")
      storyTitle = obj:GetChild("StoryTitle")
      local wordList = obj:GetChild("WordList")
      local holder = storyTitle:GetChild("EffectHolder")
      effectObj[i] = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_charstorychange.prefab", holder)
      local animObj = LuaUtil.FindChild(effectObj[i].transform, "ani").gameObject
      wordList.scrollPane.touchEffect = false
      wordList:RemoveChildrenToPool()
      wordList.height = 0
      local skillExplain = wordList:AddItemFromPool()
      storyTitle.onClick:Set(function()
        CardMgr.SaveEventNewReq({
          CardMgr.cardId
        }, {
          txtTb.id
        })
        local OpenWord = function()
          local Word1Txt = skillExplain:GetChild("Word1Txt")
          Word1Txt.text = T(v.id)
          if v.nameWordId then
            UIUtil.SetText(skillExplain, T(v.nameWordId), "NameTxt")
            ChangeUIController(skillExplain, "c1", 1)
            skillExplain.height = Word1Txt.height + 9 + 29
          else
            ChangeUIController(skillExplain, "c1", 0)
            skillExplain.height = Word1Txt.height + 9
          end
          local curHeight = wordList.height
          wordList:ResizeToFit()
          local targetHeight = wordList.height
          if curHeight ~= targetHeight then
            LuaUtil.PlayAnimation(animObj, "FX_ui_charstorychange_open")
            wordList.height = curHeight
            LeanTween.value(curHeight, targetHeight, animTime):setOnUpdate(function(value)
              wordList.height = value
            end):setEaseInOutQuad():setOnComplete(function()
              wordList.height = targetHeight
              lastWord = wordList
              lastAnimObj = animObj
            end)
          end
        end
        if lastWord then
          if wordList == lastWord then
            local newH = lastWord.height > maxHeight and maxHeight or lastWord.height
            uis.Story.StoryList.touchable = false
            LeanTween.value(newH, 0, animTime):setOnUpdate(function(value)
              lastWord.height = value
            end):setOnComplete(function()
              lastWord.height = 0
              lastWord = nil
              lastAnimObj = nil
              uis.Story.StoryList.touchable = true
            end)
            LuaUtil.PlayAnimation(lastAnimObj, "FX_ui_charstorychange_close")
            return
          end
          uis.Story.StoryList.touchable = false
          LeanTween.value(lastWord.height, 0, animTime):setEaseInOutQuad():setOnUpdate(function(value)
            lastWord.height = value
          end):setOnComplete(function()
            lastWord.height = 0
            uis.Story.StoryList.touchable = true
          end)
          LeanTween.value(uis.Story.StoryList.scrollPane.posY, 0, animTime):setEaseInOutQuad():setOnUpdate(function(value)
            uis.Story.StoryList.scrollPane.posY = value
          end):setOnComplete(function()
            uis.Story.StoryList.scrollPane.posY = 0
          end)
          LuaUtil.PlayAnimation(lastAnimObj, "FX_ui_charstorychange_close")
          OpenWord()
        else
          OpenWord()
        end
      end)
      ChangeUIController(storyTitle, "c1", 0)
      if 1 == i then
        storyTitle.onClick:Call()
      else
        LuaUtil.PlayAnimation(animObj, "FX_ui_charstorychange_close")
      end
    else
      obj = UIMgr:CreateObject("Card", "DataModular2_Lock")
      storyTitle = obj:GetChild("StoryTitle")
      storyTitle:GetChild("LockTxt").text = T(215, CardData.GetFormatNum(v.lockLv))
      ChangeUIController(storyTitle, "c1", 1)
    end
    UIUtil.SetBtnText(storyTitle, txtTb.n, txtTb.s)
    height = height + obj.height
    uis.Story.StoryList:AddChild(obj)
    if nil == maxHeight then
      maxHeight = uis.Story.StoryList.height - 164
    end
  end
end

local VoiceUnLock = function(id)
  local data = TableData.GetConfig(id, "BaseCardSound")
  local qualityBol = data.quality_level == nil or CardMgr.cardInfoData.quality >= data.quality_level
  local gradeBol = nil == data.grade_level or CardMgr.cardInfoData.grade >= data.grade_level
  if qualityBol and gradeBol then
    return true
  end
end

function CardStoryWindow.InitVoice()
  voiceData = SimpleCopy(CardMgr.cardConfigData.sound_ids)
  table.sort(voiceData, function(a, b)
    local lockA = VoiceUnLock(a)
    local lockB = VoiceUnLock(b)
    if lockA and lockB then
      return a < b
    elseif lockB then
      return false
    elseif not lockA and not lockB then
      return a < b
    else
      return true
    end
  end)
  if nil == tempMoveEffect then
    tempMoveEffect = {}
  end
  local teamAllRadId = {}
  local StoryList = uis.Voice.VoiceList.StoryList
  
  function StoryList.itemRenderer(i, item)
    local data = SimpleCopy(TableData.GetConfig(voiceData[i + 1], "BaseCardSound"))
    local qualityBol = data.quality_level == nil or CardMgr.cardInfoData.quality >= data.quality_level
    local gradeBol = nil == data.grade_level or CardMgr.cardInfoData.grade >= data.grade_level
    UIUtil.SetText(item, data.name(), "NameTxt")
    if qualityBol and gradeBol then
      if data.path and data.bank then
        data.path = Language.ReplaceLanguageVoicePath(data.path)
        data.bank = Language.ReplaceLanguageVoicePath(data.bank)
        local duration = SoundManager:GetDuration(data.path, data.bank) / 1000
        UIUtil.SetText(item, CardStoryWindow.FormatTime(math.ceil(duration)), "TimeTxt")
        item.onClick:Set(function()
          if StoryList.selectedIndex ~= i then
            item:GetChild("Red").visible = false
            CardStoryWindow.ItemClick(data, item, duration)
            StoryList.selectedIndex = i
          end
        end)
        item.touchable = true
      end
      ChangeUIController(item, nil, 0)
      if data.quality_level == nil and nil == data.grade_level or CardMgr.CheckClicked(CardMgr.cardId, data.id) then
        item:GetChild("Red").visible = false
      else
        item:GetChild("Red").visible = true
        table.insert(teamAllRadId, data.id)
      end
    else
      item:GetChild("Red").visible = false
      item.touchable = false
      item.onClick:Clear()
      if data.quality_level then
        UIUtil.SetText(item, T(215, CardData.GetFormatNum(data.quality_level)), "LockTxt")
      end
      if data.grade_level then
        UIUtil.SetText(item, T(1158, data.grade_level), "LockTxt")
      end
      ChangeUIController(item, nil, 1)
    end
  end
  
  StoryList.numItems = #voiceData
  StoryList.selectedIndex = 0
  if #teamAllRadId then
    CardMgr.SaveEventNewReq({
      CardMgr.cardId
    }, teamAllRadId, true)
  end
end

function CardStoryWindow.FormatTime(time)
  time = time % 3600
  local minutes = math.floor(time / 60)
  local seconds = time % 60
  return string.format("%02d:%02d", minutes, seconds)
end

function CardStoryWindow.ItemClick(soundData, obj, time)
  if lastItem then
    ChangeUIController(lastItem, nil, 0)
    UIUtil.SetText(lastItem, CardStoryWindow.FormatTime(math.ceil(time)), "TimeTxt")
  end
  ChangeUIController(obj, nil, 2)
  if soundData then
    CardStoryWindow.ShowWordText(soundData.des())
    CardStoryWindow.CancelTween()
    soundEventInstance = SoundManager:PlaySfxSound(soundData.path, soundData.bank)
    local duration = time
    if tempMoveEffect[soundData.id] == nil then
      local effectHolder = obj:GetChild("VoicProgressBar"):GetChild("bar"):GetChild("CardShowHolder")
      local effect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Roledetail/FX_ui_charvoice_move.prefab", effectHolder)
      LuaUtil.SetLocalPos(effect, 205, -26, 0)
      tempMoveEffect[soundData.id] = effect.transform:Find("FX_ui_charvoice_move_grp").gameObject
    end
    if -1 ~= duration then
      local speed = 10 / duration
      LuaUtil.SetAnimatorSpeed(tempMoveEffect[soundData.id], speed)
    end
    tween = LeanTween.delayedCall(duration, function()
      if lastItem then
        ChangeUIController(lastItem, nil, 0)
        animTween = LeanTween.delayedCall(0.25, function()
          UIUtil.SetText(lastItem, CardStoryWindow.FormatTime(math.ceil(time)), "TimeTxt")
          lastItem = nil
        end)
        PlayUITrans(uis.root, "WordOut")
        if timeDown then
          timeDown:stop()
          timeDown = nil
        end
      end
      tween = nil
    end)
    local downTime = math.floor(duration)
    UIUtil.SetText(obj, CardStoryWindow.FormatTime(downTime), "TimeTxt")
    timeDown = TimerUtil.new(1, downTime, function(timer, tickTime)
      UIUtil.SetText(obj, CardStoryWindow.FormatTime(math.max(downTime - tickTime, 0)), "TimeTxt")
    end, function()
      timeDown = nil
    end)
    timeDown:start()
  end
  lastItem = obj
end

function CardStoryWindow.CancelTween()
  if soundEventInstance then
    SoundManager:StopSoundEvent(soundEventInstance)
    soundEventInstance = nil
  end
  if tween then
    LeanTween.cancel(tween.uniqueId)
    tween = nil
  end
  if animTween then
    LeanTween.cancel(animTween.uniqueId)
    animTween = nil
    lastItem = nil
  end
  if timeDown then
    timeDown:stop()
    timeDown = nil
  end
end

function CardStoryWindow.ShowWordText(str)
  uis.VoiceWord.root.visible = true
  if lastItem then
    PlayUITrans(uis.root, "WordOut", function()
      uis.VoiceWord.WordTxt.text = str
      PlayUITrans(uis.root, "WordIn")
    end)
  else
    uis.VoiceWord.WordTxt.text = str
    PlayUITrans(uis.root, "WordIn")
  end
end

function CardStoryWindow.DestroyEffect()
  if effectObj then
    for i, v in pairs(effectObj) do
      ResourceManager.DestroyGameObject(v, false)
    end
  end
  effectObj = {}
end

function CardStoryWindow.OnInit()
  for i = 1, uis.Story.StoryList.numItems do
    uis.Story.StoryList:RemoveChildAt(0, true)
  end
  CardStoryWindow.InitBaseTips()
  CardStoryWindow.InitStoryTips()
  uis.Cultivate2Btn.onClick:Set(function()
    CardStoryWindow.InitVoice()
  end)
  uis.Cultivate1Btn.onClick:Set(function()
    RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.CARD)
  end)
end

function CardStoryWindow.OnClose()
  CardStoryWindow.DestroyEffect()
  CardStoryWindow.CancelTween()
  uis = nil
  lastItem = nil
  voiceData = nil
  tempMoveEffect = nil
end

return CardStoryWindow
