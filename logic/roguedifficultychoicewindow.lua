require("RogueBuild01_DifficultyChoiceWindowByName")
local RogueDifficultyChoiceWindow = {}
local uis, contentPane, jumpTb, difficultyData, curPlay

function RogueDifficultyChoiceWindow.ReInitData()
end

function RogueDifficultyChoiceWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueDifficultyChoiceWindow.package, WinResConfig.RogueDifficultyChoiceWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    local groupId = bridgeObj.argTable[1]
    uis = GetRogueBuild01_DifficultyChoiceWindowUis(contentPane)
    difficultyData = RogueDifficultyChoiceWindow.GetDifficultyData(groupId)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.ROGUE_SELECT_LEVEL)
    RogueDifficultyChoiceWindow.UpdateInfo()
    RogueDifficultyChoiceWindow.InitBtn()
  end)
end

function RogueDifficultyChoiceWindow.UpdateInfo()
  local list = uis.Main.PositionShow.PositionList
  local themeInfo = RogueData.GetRogueTheme()
  if themeInfo then
    local curLevel = RogueMgr.difficultyLevel
    local unlockedDifficultyLevel = themeInfo.unlockedDifficultyLevel + 1
    local disNum = #difficultyData - 1
    local curPerY = 1 - unlockedDifficultyLevel * (1 / disNum)
    local lastPerY = curPerY
    local lastItem
    
    function list.itemRenderer(i, item)
      local data = difficultyData[i + 1]
      local title = item:GetChild("Title")
      UIUtil.SetText(title, T(1369), "Word1Txt")
      UIUtil.SetText(title, data.name(), "WordTxt")
      UIUtil.SetText(title, data.level, "NumberTxt")
      UIUtil.SetText(item, data.des(), "WordTxt")
      ChangeUIController(item, "c2", data.show_type)
      local sureBtn = item:GetChild("SureBtn")
      UIUtil.SetText(sureBtn, T(1370), "WordTxt")
      sureBtn.onClick:Set(function()
        PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ROGUE_DIFFICULTY_LEVEL, data.level)
        RogueMgr.difficultyLevel = data.level
        UIMgr:CloseWindow(WinResConfig.RogueDifficultyChoiceWindow.name)
      end)
      if unlockedDifficultyLevel >= data.level then
        ChangeUIController(item, "lock", 1)
      else
        ChangeUIController(item, "lock", 0)
        UIUtil.SetText(item:GetChild("Lock"), T(1443, data.level - 1), "WordTxt")
      end
      item.onClick:Set(function()
        if unlockedDifficultyLevel >= data.level then
          list.scrollPane:SetPercY(i * (1 / disNum), true)
        end
      end)
    end
    
    list.numItems = #difficultyData
    list.scrollPane.onScrollEnd:Set(function()
      local index = math.floor(list.scrollPane.percY * disNum + 0.5)
      local item = list:GetChildAt(index)
      if item and index then
        ChangeUIController(item, "c1", 1)
        RogueDifficultyChoiceWindow.ShowInfo(difficultyData[index + 1])
        lastItem = item
        lastPerY = list.scrollPane.percY
      end
    end)
    list.scrollPane.onScroll:Set(function()
      if list.scrollPane.percY < curPerY then
        list.scrollPane:CancelDragging()
        list.scrollPane.percY = curPerY
        lastPerY = list.scrollPane.percY
        list.scrollPane.onScrollEnd:Call()
        return
      end
      if math.abs(list.scrollPane.percY - lastPerY) > 0.02 then
        ChangeUIController(lastItem, "c1", 0)
      end
    end)
    list.scrollPane.percY = 1 - curLevel * (1 / disNum)
    list.scrollPane.onScrollEnd:Call()
  end
end

function RogueDifficultyChoiceWindow.ShowInfo(data)
  local tips = uis.Main.DifficultyTips
  tips.WordTxt.text = data.name()
  tips.NumberTxt.text = data.level
  if data.score_ratio then
    tips.ScoreAdd.WordTxtTxt.text = T(1371)
    tips.ScoreAdd.NumberTxt.text = T(1372, FormatValidateNum(data.score_ratio / 100))
    tips.c1Ctr.selectedIndex = 1
  else
    tips.c1Ctr.selectedIndex = 0
  end
  if data.buff_list then
    function tips.EffectList.itemRenderer(i, item)
      local buffData = TableData.GetConfig(data.buff_list[i + 1], "BaseSkillBuffPre")
      
      if buffData then
        local effect = item:GetChild("Effect")
        effect.alpha = 0
        UIUtil.SetText(effect, buffData.des(), "WordTxt")
        PlayUITrans(item, "up", nil, 0.08 * i)
      end
    end
    
    tips.EffectList.numItems = #data.buff_list
  else
    function tips.EffectList.itemRenderer(i, item)
      if data.des then
        local effect = item:GetChild("Effect")
        
        effect.alpha = 0
        UIUtil.SetText(effect, data.des(), "WordTxt")
        PlayUITrans(item, "up", nil, 0.08 * i)
      end
    end
    
    tips.EffectList.numItems = 1
  end
  if curPlay then
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ROGUE_DIFFICULTY_SELET)
  end
  curPlay = data.id
end

function RogueDifficultyChoiceWindow.GetDifficultyData(groupId)
  local data = TableData.GetTable("BaseRogueDifficulty")
  local newTb = {}
  for i, v in pairs(data) do
    if v.group_id == groupId then
      table.insert(newTb, v)
    end
  end
  if #newTb > 1 then
    table.sort(newTb, function(a, b)
      return a.level > b.level
    end)
  end
  return newTb
end

function RogueDifficultyChoiceWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.RogueDifficultyChoiceWindow.name, uis.Main.CurrencyReturn)
end

function RogueDifficultyChoiceWindow.OnClose()
  uis = nil
  contentPane = nil
  difficultyData = nil
  curPlay = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return RogueDifficultyChoiceWindow
