require("Formation_MonsterTipsWindowByName")
local FormationMonsterTipsWindow = {}
local uis, contentPane

function FormationMonsterTipsWindow.ReInitData()
end

local monsterConfig, closeCallback, params

function FormationMonsterTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.FormationMonsterTipsWindow.package, WinResConfig.FormationMonsterTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetFormation_MonsterTipsWindowUis(contentPane)
    monsterConfig, closeCallback, params = bridgeObj.argTable[1], bridgeObj.argTable[2], bridgeObj.argTable[3]
    FormationMonsterTipsWindow.UpdateInfo()
    FormationMonsterTipsWindow.InitBtn()
  end)
end

function FormationMonsterTipsWindow.UpdateInfo()
  local monsterHolder = uis.Main.MonsterPic.MonsterHolder
  local fashionConfig = TableData.GetConfig(monsterConfig.fashionId, "BaseFashion")
  UIUtil.SetCardBattleSpine(ModelUtil.GetFullPath(fashionConfig.spd), monsterHolder, SPINE_STATE_ENUM.IDLE, true, Const.cardScale * fashionConfig.manor_scale / 10000, true, function(spineModel)
    SkeletonAnimationUtil.SetFlip(spineModel, false, false)
    SkeletonAnimationUtil.SetShaderEffectEnable(spineModel, false, false)
  end)
  local monsterInfoList = uis.Main.MonsterInfoList
  monsterInfoList:RemoveChildrenToPool()
  local config = TableData.GetConfig(monsterConfig.id, "BaseMonster")
  local monsterInfo = monsterInfoList:AddItemFromPool(UIUtil.GetResUrl("Formation:MonsterInfo"))
  require("Formation_MonsterInfoByName")
  local monsterInfoUis = GetFormation_MonsterInfoUis(monsterInfo)
  monsterInfoUis.NameTxt.text = config.name()
  local elementList = monsterInfoUis.ElementList
  UIUtil.ShowElementList(elementList, config)
  monsterInfoUis.ElementTxt.text = CardData.GetElementTxt(config.element_type)
  local occupation = monsterInfoUis.Occupation
  occupation.c1Ctr.selectedIndex = config.type - 1
  monsterInfoUis.OccupationTxt.text = CardData.GetOccupationTxt(config.type)
  local contentList = monsterInfoUis.MonsterAttributeModule.ContentList
  local displayAttributeTable = {
    {
      id = ProtoEnum.ATTR_ID.ATK,
      name = T(80000103),
      index = 1
    },
    {
      id = ProtoEnum.ATTR_ID.DEF,
      name = T(80000104),
      index = 2
    },
    {
      id = ProtoEnum.ATTR_ID.MAX_HP,
      name = T(80000102),
      index = 0
    }
  }
  local attrData = CardData.CalculatorCardAttr(monsterConfig, params)
  contentList:RemoveChildrenToPool()
  for i, v in ipairs(displayAttributeTable) do
    local attribute = contentList:AddItemFromPool()
    if v.id == ProtoEnum.ATTR_ID.MAX_HP and 1 == config.no_statistics_hp then
      attribute:GetChild("NumberTxt").text = "-"
    else
      attribute:GetChild("NumberTxt").text = attrData[v.id]
    end
    ChangeUIController(attribute, nil, v.index)
  end
  monsterInfoUis.MonsterType.NameTxt.text = CardData.GetMonsterRankName(config.rank)
  local url = UIUtil.GetResUrl("Formation:MonsterSkill")
  local _, skillInfoList = CardData.GetConfigSkill(config)
  if #skillInfoList > 0 then
    for _, v in ipairs(skillInfoList) do
      local skillConfig = TableData.GetConfig(v.id, "BaseSkill")
      local skill = monsterInfoList:AddItemFromPool(url)
      local indexStr = ""
      if skillConfig.rome_index then
        indexStr = NumberUtil.IntToRome(skillConfig.rome_index)
      end
      skill:GetChild("NameTxt").text = CardData.GetSkillTypeName(skillConfig.type, nil, true) .. " " .. indexStr
      local skillLevelUpConfig = TableData.GetConfig(v.id * 1000 + v.level, "BaseSkillLevelUp")
      skill:GetChild("WordTxt").text = skillLevelUpConfig.des and skillLevelUpConfig.des()
      local skillType = skillConfig.type
      if skillType == SKILL_TYPE_ENUM.BURST_CARD or skillType == SKILL_TYPE_ENUM.UNIQUE then
        ChangeUIController(skill, "c1", 2)
      elseif skillType == SKILL_TYPE_ENUM.SMALL then
        ChangeUIController(skill, "c1", 1)
      elseif skillType == SKILL_TYPE_ENUM.NORMAL then
        ChangeUIController(skill, "c1", 0)
      elseif skillType == SKILL_TYPE_ENUM.PASSIVE or skillType == SKILL_TYPE_ENUM.EX then
        ChangeUIController(skill, "c1", 3)
      end
    end
  end
end

function FormationMonsterTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Add(FormationMonsterTipsWindow.Close)
end

function FormationMonsterTipsWindow.Close()
  if closeCallback then
    closeCallback()
    closeCallback = nil
  end
  UIMgr:CloseWindow(WinResConfig.FormationMonsterTipsWindow.name)
end

function FormationMonsterTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  monsterConfig, closeCallback, params = nil, nil, nil
end

return FormationMonsterTipsWindow
