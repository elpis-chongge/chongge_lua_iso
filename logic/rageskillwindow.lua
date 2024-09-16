require("RaidBossTips_RageSkillWindowByName")
local RageSkillWindow = {}
local uis, contentPane, monsterIdList

function RageSkillWindow.ReInitData()
end

function RageSkillWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RageSkillWindow.package, WinResConfig.RageSkillWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRaidBossTips_RageSkillWindowUis(contentPane)
    monsterIdList = bridgeObj.argTable[1]
    RageSkillWindow.UpdateInfo()
    RageSkillWindow.InitBtn()
  end)
end

function RageSkillWindow.UpdateInfo()
  if monsterIdList and #monsterIdList > 1 then
    local monster1 = monsterIdList[#monsterIdList - 1]
    local monsterConfig1 = TableData.GetConfig(monster1, "BaseMonster")
    local _, skillInfoList1 = CardData.GetConfigSkill(monsterConfig1)
    local monster2 = monsterIdList[#monsterIdList]
    local monsterConfig2 = TableData.GetConfig(monster2, "BaseMonster")
    local _, skillInfoList2 = CardData.GetConfigSkill(monsterConfig2)
    if #skillInfoList1 == #skillInfoList2 then
      local list = uis.Main.SkillList
      list:RemoveChildrenToPool()
      local count = #skillInfoList1
      for i = 1, count do
        local curSkill1 = skillInfoList1[i]
        local curSkill2 = skillInfoList2[i]
        local hand = list:AddItemFromPool()
        local skillId1 = curSkill1.id
        local skillConfig1 = TableData.GetConfig(skillId1, "BaseSkill")
        local skillId2 = curSkill2.id
        local skillConfig2 = TableData.GetConfig(skillId2, "BaseSkill")
        local skillType = skillConfig1.type
        if skillType == SKILL_TYPE_ENUM.BURST_CARD or skillType == SKILL_TYPE_ENUM.UNIQUE then
          ChangeUIController(hand, "c1", 2)
        elseif skillType == SKILL_TYPE_ENUM.SMALL then
          ChangeUIController(hand, "c1", 1)
        elseif skillType == SKILL_TYPE_ENUM.NORMAL then
          ChangeUIController(hand, "c1", 0)
        elseif skillType == SKILL_TYPE_ENUM.PASSIVE or skillType == SKILL_TYPE_ENUM.EX then
          ChangeUIController(hand, "c1", 3)
        end
        local indexStr = ""
        if skillConfig1.rome_index then
          indexStr = NumberUtil.IntToRome(skillConfig1.rome_index)
        end
        hand:GetChild("Title").text = CardData.GetSkillTypeName(skillConfig1.type, nil, true) .. " " .. indexStr
        local skillLevelUpConfig1 = TableData.GetConfig(skillId1 * 1000 + curSkill1.level, "BaseSkillLevelUp")
        local skillLevelUpConfig2 = TableData.GetConfig(skillId2 * 1000 + curSkill2.level, "BaseSkillLevelUp")
        hand:GetChild("killWord1"):GetChild("WordTxt").text = skillLevelUpConfig1.des and skillLevelUpConfig1.des()
        hand:GetChild("killWord2"):GetChild("WordTxt").text = skillLevelUpConfig2.des and skillLevelUpConfig2.des()
        if monsterConfig1.phase_name then
          local word = hand:GetChild("killWord1")
          ChangeUIController(word, "c1", 0)
          word:GetChild("NameTxt").text = monsterConfig1.phase_name()
        end
        if monsterConfig2.phase_name then
          local word = hand:GetChild("killWord2")
          ChangeUIController(word, "c1", 1)
          word:GetChild("NameTxt").text = monsterConfig2.phase_name()
        end
      end
    end
  end
end

function RageSkillWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Add(RageSkillWindow.TouchClose)
end

function RageSkillWindow.TouchClose()
  UIMgr:CloseWindow(WinResConfig.RageSkillWindow.name)
end

function RageSkillWindow.OnClose()
  monsterIdList = nil
  uis = nil
  contentPane = nil
end

return RageSkillWindow
