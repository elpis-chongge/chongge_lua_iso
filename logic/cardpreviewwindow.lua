require("CardPreview_CardPreviewWindowByName")
local CardPreviewWindow = {}
local uis, contentPane, jumpTb, cardId

function CardPreviewWindow.ReInitData()
end

function CardPreviewWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.CardPreviewWindow.package, WinResConfig.CardPreviewWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetCardPreview_CardPreviewWindowUis(contentPane)
    cardId = bridgeObj.argTable[1]
    CardPreviewWindow.UpdateInfo()
    CardPreviewWindow.InitBtn()
  end)
end

function CardPreviewWindow.UpdateInfo()
  UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/NoiseUIBack/FX_ui_CardPreview_1000.prefab", uis.Main.BackGround.BackGroundHolder)
  local cardConfig = TableData.GetConfig(cardId, "BaseCard")
  local cardLevelConfig = CardData.GetCardLevelUpConfig(cardConfig.grow_model_id, cardConfig.level)
  local cardShow = uis.Main.CardShow
  UIUtil.SetCardShowSpineAutoAlpha(cardConfig.fashion_id, cardShow.CardShowLoader, cardShow.CardShowHolder)
  local cardName = uis.Main.CardName
  cardName.NameTxt.text = cardConfig.name()
  cardName.SubtitleTxt.text = cardConfig.name_english()
  cardName.c1Ctr.selectedIndex = cardConfig.star - 1
  local info1 = uis.Main.Info_1
  local info2 = uis.Main.Info_2
  local info3 = uis.Main.Info_3
  info1.LevelTxt.text = T(11010, cardLevelConfig.level_show)
  UIUtil.ShowStarList(info1.StarList, cardConfig, cardConfig)
  local elementList = info1.ElementList
  UIUtil.ShowElementList(elementList, cardConfig)
  info1.Occupation.c1Ctr.selectedIndex = cardConfig.type - 1
  info1.CardBreach.c1Ctr.selectedIndex = cardConfig.quality
  local cardHead = info1.CardHead
  cardHead.c1Ctr.selectedIndex = cardConfig.star - 1
  UIUtil.SetHeadByFaceId(cardConfig.fashion_id, cardHead.CardHeadBg.PicLoader, HEAD_ICON_TYPE_ENUM.RECT)
  info1.LookBtn.onClick:Set(function()
    OpenWindow(WinResConfig.StarSkillWindow.name, nil, cardId, cardConfig.grade)
  end)
  local cardAttributeList = info1.AttributeList
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
  local cardInfo = {
    cardId = cardId,
    level = cardConfig.level,
    grade = cardConfig.grade,
    quality = cardConfig.quality,
    skill2Level = CardData.GetCardSkillFromConfig(cardId)
  }
  local attrData = CardData.CalculatorCardAttr(cardInfo)
  cardAttributeList:RemoveChildrenToPool()
  for i, v in ipairs(displayAttributeTable) do
    local attribute = cardAttributeList:AddItemFromPool()
    attribute:GetChild("NumberTxt").text = attrData[v.id]
    ChangeUIController(attribute, nil, v.index)
  end
  local breachSkillList = info2.BreachSkillList
  breachSkillList:RemoveChildrenToPool()
  local cardSkillList = info3.CardSkillList
  local skillId = {
    cardConfig.leader_skill,
    cardConfig.special_skill,
    cardConfig.burst_skill
  }
  for i = 1, #skillId do
    if skillId[i] then
      local info = CardData.GetCardDataById(cardId)
      local skill = cardSkillList:AddItemFromPool()
      UIUtil.ShowCardSkill(skill, skillId[i], info and info.skill2Level[skillId[i]] or nil)
      skill.onClick:Set(function()
      end)
    end
  end
  cardSkillList.onClick:Set(function()
    local skillInfo = CardPreviewWindow.GetSkillDesData(cardConfig)
    OpenWindow(WinResConfig.DetailsAllSkillWindow.name, nil, skillInfo)
  end)
end

function CardPreviewWindow.GetSkillDesData(cardConfig)
  local cardInfo = CardData.GetCardDataById(cardConfig.id)
  local GetSkillLv = function(skillId)
    if nil == cardInfo then
      return 1
    end
    local lv = cardInfo.skill2Level[skillId] or 1
    local addLv = cardInfo.gradeUpSkills[skillId] or 0
    return lv + addLv
  end
  local skillInfo = {}
  local skillId = {
    cardConfig.leader_skill,
    cardConfig.normal_skill,
    cardConfig.special_skill,
    cardConfig.burst_skill
  }
  for i = 1, #skillId do
    local data = TableData.GetConfig(skillId[i], "BaseSkill")
    if data then
      table.insert(skillInfo, {
        id = skillId[i],
        type = data.type,
        level = GetSkillLv(data.id),
        cardInfo = cardInfo
      })
    end
  end
  return skillInfo
end

function CardPreviewWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.CardPreviewWindow.name, uis.Main.CurrencyReturn)
end

function CardPreviewWindow.OnClose()
  uis = nil
  contentPane = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return CardPreviewWindow
