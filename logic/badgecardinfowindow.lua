require("CardAttribute_BadgeCardInfoWindowByName")
local BadgeCardInfoWindow = {}
local uis, contentPane, cardInfo, skillInfo

function BadgeCardInfoWindow.ReInitData()
end

function BadgeCardInfoWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BadgeCardInfoWindow.package, WinResConfig.BadgeCardInfoWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetCardAttribute_BadgeCardInfoWindowUis(contentPane)
    cardInfo = bridgeObj.argTable[1]
    BadgeCardInfoWindow.UpdateInfo()
    BadgeCardInfoWindow.InitBtn()
    BadgeCardInfoWindow.InitUI()
  end)
end

function BadgeCardInfoWindow.GetData()
  local config = TableData.GetTable("BaseAttribute")
  local t = {}
  if config then
    for i, v in pairs(config) do
      if v.sort then
        table.insert(t, v)
      end
    end
  end
  table.sort(t, function(a, b)
    return a.sort < b.sort
  end)
  return t
end

function BadgeCardInfoWindow.ShowAttribute(show_type, item, attribute)
  if 1 == show_type then
    UIUtil.SetText(item, attribute, "NumberTxt")
  elseif 2 == show_type then
    UIUtil.SetText(item, T(91, FormatValidateNum(attribute / 100)), "NumberTxt")
  elseif 3 == show_type then
    UIUtil.SetText(item, GetPreciseDecimal(FormatValidateNum(attribute / 1000), 2), "NumberTxt")
  end
end

function BadgeCardInfoWindow.ShowAddAttribute(show_type, item, attribute)
  if 1 == show_type then
    UIUtil.SetText(item, T(380, attribute), "AddNumberTxt")
  elseif 2 == show_type then
    UIUtil.SetText(item, T(380, T(91, FormatValidateNum(attribute / 100))), "AddNumberTxt")
  elseif 3 == show_type then
    UIUtil.SetText(item, T(380, GetPreciseDecimal(FormatValidateNum(attribute / 1000), 2)), "AddNumberTxt")
  end
end

local GetValue = function(value_enhance, baseValue)
  if value_enhance < 0 then
    return math.ceil(baseValue * 10000 / (10000 - value_enhance))
  elseif value_enhance > 0 then
    return math.ceil(baseValue * (10000 + value_enhance) / 10000)
  end
end

function BadgeCardInfoWindow.InitUI()
  local data = BadgeCardInfoWindow.GetData()
  local list = uis.Main.CardScreen1.CardAttributeList
  local badgeAttribute = CardData.GetBadgeAddAttribute(cardInfo.cardId)
  local moveId = CardAttribute.GetIdByName("spd_move")
  local atkId = CardAttribute.GetIdByName("spd_atk")
  local moveIdPer = CardAttribute.GetIdByName("spd_move_enhance")
  local atkIdPer = CardAttribute.GetIdByName("spd_atk_enhance")
  local attributeNun = {
    ProtoEnum.ATTR_ID.ATK,
    ProtoEnum.ATTR_ID.DEF,
    ProtoEnum.ATTR_ID.MAX_HP
  }
  
  function list.itemRenderer(i, item)
    local index = i + 1
    local id = data[index].id
    ChangeUIController(item, "c1", data[index].sort)
    ChangeUIController(item, "c2", index % 2)
    ChangeUIController(item, "c3", data[index].des and 1 or 0)
    UIUtil.SetText(item, data[index].display_name())
    local cardAttribute = cardInfo.attributes[id] or 0
    local attributeBadge = badgeAttribute[id] or 0
    local attrValue = cardAttribute + attributeBadge
    if table.contain(attributeNun, id) and 0 ~= attributeBadge then
      attrValue = cardAttribute
      BadgeCardInfoWindow.ShowAddAttribute(data[index].show_type, item, attributeBadge)
    else
      attrValue = cardAttribute + attributeBadge
      if id == moveId then
        local badgeEnhance = badgeAttribute[moveIdPer] or 0
        local cardEnhance = cardInfo.attributes[moveIdPer] or 0
        if 0 ~= cardEnhance + badgeEnhance then
          attrValue = GetValue(badgeEnhance + cardEnhance, cardAttribute)
        end
      elseif id == atkId then
        local badgeEnhance = badgeAttribute[atkIdPer] or 0
        local cardEnhance = cardInfo.attributes[atkIdPer] or 0
        if 0 ~= cardEnhance + badgeEnhance then
          attrValue = GetValue(cardEnhance + badgeEnhance, cardAttribute)
        end
      end
    end
    BadgeCardInfoWindow.ShowAttribute(data[index].show_type, item, attrValue)
    item:GetChild("CardAttributeTipsBtn").onClick:Set(function()
      if data[index].des then
        OpenWindow(WinResConfig.BadgeCardAttributeTipsWindow.name, nil, {
          des = data[index].des(),
          titleTxt = data[index].display_name()
        })
      end
    end)
    item.onClick:Set(function()
      if list.selectedIndex ~= i then
        list.selectedIndex = i
      end
    end)
    if 0 == i then
      item.onClick:Call()
    end
  end
  
  list.numItems = #data
end

function BadgeCardInfoWindow.GetSkillInfo()
  skillInfo = {}
  local configData = TableData.GetConfig(cardInfo.cardId, "BaseCard")
  if configData then
    local skillData = {
      configData.leader_skill,
      configData.special_skill,
      configData.burst_skill
    }
    local GetSkillLv = function(skillId)
      local lv = cardInfo.skill2Level[skillId] or 1
      local addLv = cardInfo.gradeUpSkills[skillId] or 0
      return lv + addLv
    end
    for i = 1, #skillData do
      local data = TableData.GetConfig(skillData[i], "BaseSkill")
      table.insert(skillInfo, {
        id = data.id,
        type = data.type,
        level = GetSkillLv(data.id),
        cardInfo = cardInfo
      })
    end
  end
end

function BadgeCardInfoWindow.UpdateInfo()
  BadgeCardInfoWindow.GetSkillInfo()
  
  function uis.Main.SpclSkillTipsList.itemRenderer(i, tips)
    local skillData = TableData.GetConfig(skillInfo[i + 1].id, "BaseSkill")
    local skill2Level = {}
    if skillInfo[i + 1].cardInfo.skillLevels then
      skill2Level = {}
      local skillLevels = skillInfo[i + 1].cardInfo.skillLevels
      for i, v in ipairs(skillLevels) do
        skill2Level[v.skillId] = v.level
      end
    elseif skillInfo[i + 1].cardInfo.skill2Level then
      skill2Level = skillInfo[i + 1].cardInfo.skill2Level
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
            BadgeCardInfoWindow.ShowSkillDes(detailsSkillInfo, skillData.association_skills, skillInfo[i + 1])
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
    ChangeUIController(tips, "c1", skill2Level[skillData.id] and 0 or 1)
    PlayUITrans(tips, skill2Level[skillData.id] and "in" or "inlock", nil, i * 0.1)
  end
  
  uis.Main.SpclSkillTipsList.numItems = #skillInfo
end

function BadgeCardInfoWindow.ShowSkillDes(info, skills, skInfo)
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

function BadgeCardInfoWindow.InitBtn()
  uis.Main.c1Ctr.selectedIndex = 0
  UIUtil.SetText(uis.Main.SwitchBtn, T(1351))
  uis.Main.SwitchBtn.onClick:Set(function()
    uis.Main.c1Ctr.selectedIndex = 0 == uis.Main.c1Ctr.selectedIndex and 1 or 0
    UIUtil.SetText(uis.Main.SwitchBtn, 1 == uis.Main.c1Ctr.selectedIndex and T(1352) or T(1351))
  end)
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.BadgeCardInfoWindow.name)
  end)
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.BadgeCardInfoWindow.name)
  end)
end

function BadgeCardInfoWindow.OnClose()
  uis = nil
  contentPane = nil
  cardInfo = nil
  skillInfo = nil
end

return BadgeCardInfoWindow
