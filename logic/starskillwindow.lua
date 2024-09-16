require("Message_StarSkillWindowByName")
local StarSkillWindow = {}
local uis, contentPane, cardId

function StarSkillWindow.ReInitData()
end

function StarSkillWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.StarSkillWindow.package, WinResConfig.StarSkillWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    cardId = bridgeObj.argTable[1]
    uis = GetMessage_StarSkillWindowUis(contentPane)
    StarSkillWindow.UpdateInfo()
    StarSkillWindow.InitBtn()
  end)
end

function StarSkillWindow.UpdateInfo()
  local skillList = uis.Main.SkillList
  local cardConfig = TableData.GetConfig(cardId, "BaseCard")
  local cardInfo = CardData.GetCardDataById(cardId)
  local unlockSkillList = cardConfig.unlock_skill_ids
  
  function skillList.itemRenderer(i, item)
    local skillConfig = TableData.GetConfig(unlockSkillList[i + 1], "BaseSkill")
    item:GetChild("PicLoader").url = UIUtil.GetResUrl(skillConfig.icon)
    if skillConfig.name then
      UIUtil.SetText(item, skillConfig.name(), "NameTxt")
    end
    UIUtil.SetText(item:GetChild("Lock"), i + 1, "WordTxt")
    ChangeUIController(item, "c1", cardInfo and cardInfo.skill2Level[skillConfig.id] and 1 or 0)
    local curSkillLevel = cardInfo and cardInfo.skill2Level[skillConfig.id] and cardInfo.skill2Level[skillConfig.id] or 1
    local skillLevelUpConfig = TableData.GetConfig(skillConfig.id * 1000 + curSkillLevel, "BaseSkillLevelUp")
    local wordList = item:GetChild("WordList")
    
    function wordList.itemRenderer(index, word)
      word:GetChild("WordTxt").text = skillLevelUpConfig.des()
    end
    
    wordList.numItems = 1
    ChangeUIController(item, "c2", i + 1 == #unlockSkillList and 1 or 0)
  end
  
  skillList.numItems = #unlockSkillList
end

function StarSkillWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Add(StarSkillWindow.Close)
  uis.Main.CloseBtn.onClick:Add(StarSkillWindow.Close)
end

function StarSkillWindow.Close()
  UIMgr:CloseWindow(WinResConfig.StarSkillWindow.name)
end

function StarSkillWindow.OnClose()
  uis = nil
  contentPane = nil
  cardId = nil
  unlockSkillList = nil
end

return StarSkillWindow
