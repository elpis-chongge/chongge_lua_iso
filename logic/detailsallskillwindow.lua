require("CardAttribute_DetailsAllSkillWindowByName")
local DetailsAllSkillWindow = {}
local uis, contentPane, skillInfo

function DetailsAllSkillWindow.ReInitData()
end

function DetailsAllSkillWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.DetailsAllSkillWindow.package, WinResConfig.DetailsAllSkillWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetCardAttribute_DetailsAllSkillWindowUis(contentPane)
    skillInfo = bridgeObj.argTable[1]
    DetailsAllSkillWindow.InitBtn()
    DetailsAllSkillWindow.UpdateInfo()
  end)
end

function DetailsAllSkillWindow.UpdateInfo()
  function uis.Main.SpclSkillTipsList.itemRenderer(i, tips)
    local skillData = TableData.GetConfig(skillInfo[i + 1].id, "BaseSkill")
    
    local skill2Level = {}
    if skillInfo[i + 1].cardInfo then
      if skillInfo[i + 1].cardInfo.skillLevels then
        skill2Level = {}
        local skillLevels = skillInfo[i + 1].cardInfo.skillLevels
        for i, v in ipairs(skillLevels) do
          skill2Level[v.skillId] = v.level
        end
      elseif skillInfo[i + 1].cardInfo.skill2Level then
        skill2Level = skillInfo[i + 1].cardInfo.skill2Level
      end
    end
    if skillData then
      local list = tips:GetChild("TipsList")
      
      function list.itemRenderer(ii, skill)
        UIUtil.SetText(skill, skillData.name(), "NameTxt")
        local detailsSkillIcon = skill:GetChild("DetailsSkillIcon")
        if detailsSkillIcon then
          CardMgr.ShowSkillTypeInfo(skillData, detailsSkillIcon)
          detailsSkillIcon:GetChild("Skill"):GetChild("IconLoader").url = UIUtil.GetResUrl(skillData.icon)
        end
        local id = skillData.id * 1000 + skillInfo[i + 1].level
        local skillLvData = TableData.GetConfig(id, "BaseSkillLevelUp")
        local desText = skill:GetChild("WordTxt")
        if skillLvData and skillLvData.des and desText then
          desText.text = skillLvData.des()
        end
        if skillData.type == SKILL_TYPE_ENUM.LEADER then
          UIUtil.SetText(skill, "", "LevelTxt")
          local leaderSkillInfo = skill:GetChild("LeaderSkillInfo")
          ChangeUIController(leaderSkillInfo, "c1", skill2Level[skillData.id] and 1 or 0)
          UIUtil.SetText(leaderSkillInfo, T(1310), "TitleTxt")
          UIUtil.SetText(leaderSkillInfo, T(1312), "WordTxt")
          ChangeUIController(skill, "c1", 2)
        else
          local lv = T(244, skillInfo[i + 1].level)
          UIUtil.SetText(skill, lv, "LevelTxt")
          if skillData.association_skills then
            local detailsSkillInfo = skill:GetChild("DetailsSkillInfo")
            DetailsAllSkillWindow.ShowSkillDes(detailsSkillInfo, skillData.association_skills, skillInfo[i + 1])
            local SizeImage = skill:GetChild("SizeImage")
            SizeImage:SetSize(SizeImage.width, 152 + detailsSkillInfo.height + desText.height)
            ChangeUIController(skill, "c1", 1)
          else
            ChangeUIController(skill, "c1", 0)
            local SizeImage = skill:GetChild("SizeImage")
            SizeImage:SetSize(SizeImage.width, 152 + desText.height)
          end
        end
      end
      
      list.numItems = 1
    end
    UIUtil.SetText(tips:GetChild("SkillLeaderLcok"), T(1311), "WordTxt")
    if skill2Level[skillData.id] or skillInfo[i + 1].cardInfo == nil and skillData.type ~= SKILL_TYPE_ENUM.LEADER then
      ChangeUIController(tips, "c1", 0)
    else
      ChangeUIController(tips, "c1", 1)
    end
    PlayUITrans(tips, skill2Level[skillData.id] and "in" or "inlock", nil, i * 0.1)
  end
  
  uis.Main.SpclSkillTipsList.numItems = #skillInfo
end

function DetailsAllSkillWindow.ShowSkillDes(info, skills, skInfo)
  UIUtil.SetText(info, T(1135), "TitleTxt")
  local list = info:GetChild("SkillList")
  local name = {
    T(1136),
    T(1137),
    T(1138)
  }
  
  function list.itemRenderer(i, item)
    local arr = Split(skills[i + 1], ":")
    local type = tonumber(arr[1])
    if type and name[type + 1] then
      UIUtil.SetText(item, name[type + 1], "NameTxt")
      ChangeUIController(item, "c1", type)
    end
    if 0 == type then
      local lockLv = string.sub(arr[2], -3)
      if lockLv then
        lockLv = tonumber(lockLv)
        ChangeUIController(item, "c2", lockLv <= skInfo.level and 1 or 0)
      end
    elseif 1 == type then
      local star = tonumber(arr[3])
      if skInfo.cardInfo and star and star <= skInfo.cardInfo.grade then
        ChangeUIController(item, "c2", 1)
      else
        ChangeUIController(item, "c2", 0)
      end
    elseif 2 == type then
      local badgeId = tonumber(arr[3])
      local badgeStar = tonumber(arr[4])
      local badgeInfo = ActorData.GetBadgeInfoById(badgeId)
      if badgeInfo and badgeStar and badgeStar <= badgeInfo.grade then
        ChangeUIController(item, "c2", 1)
      else
        ChangeUIController(item, "c2", 0)
      end
    end
    local skillLvData = TableData.GetConfig(tonumber(arr[2]), "BaseSkillLevelUp")
    if skillLvData and skillLvData.association_des then
      UIUtil.SetText(item, skillLvData.association_des(), "WordTxt")
    end
  end
  
  list.numItems = #skills
  list:ResizeToFit()
end

function DetailsAllSkillWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.DetailsAllSkillWindow.name)
  end)
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.DetailsAllSkillWindow.name)
  end)
end

function DetailsAllSkillWindow.OnClose()
  uis = nil
  contentPane = nil
  skillInfo = nil
end

return DetailsAllSkillWindow
