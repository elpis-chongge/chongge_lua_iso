local UIUtil = {}

function UIUtil.GetResUrl(resStr)
  local resStrTable = Split(resStr, ":")
  if resStrTable and #resStrTable > 1 then
    return UIMgr:GetItemUrl(resStrTable[1], resStrTable[2])
  end
end

function UIUtil.GetBackgroundUrl(featureId)
  local config = TableData.GetConfig(featureId, "BaseFeature")
  if config and config.back_ground then
    return UIUtil.GetResUrl(config.back_ground)
  end
end

function UIUtil.SetIconById(loader, itemId, small)
  local config = TableData.GetConfig(itemId, "BaseItem")
  if config then
    local icon = small and config.icon_small or config.icon
    if string.isEmptyOrNil(icon) then
      icon = config.icon
    end
    loader.url = UIUtil.GetResUrl(icon)
  end
end

function UIUtil.SetLoaderTexture(loader, texture)
  if nil ~= loader then
    loader.texture = FairyGUI.NTexture(texture)
    loader.image:SetSkipFairyBatching()
  else
    printError("error, loader is nil")
  end
end

function UIUtil.OpenPreviewTips(id, type, badgeUid, notShowWay)
  if type == ProtoEnum.TUPLE_TYPE.ITEM or type == ProtoEnum.TUPLE_TYPE.BGM then
    OpenWindow(WinResConfig.ItemGetTipsWindow.name, nil, {id = id, notShowWay = notShowWay})
  elseif type == ProtoEnum.TUPLE_TYPE.T_FASHION then
    OpenWindow(WinResConfig.ClothesDetailsWindow.name, nil, id)
  elseif type == ProtoEnum.TUPLE_TYPE.CARD then
    OpenWindow(WinResConfig.CardPreviewWindow.name, nil, id)
  elseif type == ProtoEnum.TUPLE_TYPE.BADGE then
    if badgeUid then
      OpenWindow(WinResConfig.BadgeInfoTipsWindow.name, nil, badgeUid, notShowWay)
    else
      OpenWindow(WinResConfig.BadgeUnknownTipsWindow.name, nil, id)
    end
  end
end

function UIUtil.SetPopupBtnGroup(btnGroupObject, sureBtnParam, cancelBtnParam)
  if sureBtnParam and cancelBtnParam then
    ChangeUIController(btnGroupObject, "c1", 1)
    local sureBtn = btnGroupObject:GetChild("Popup_S_Green_Btn")
    if sureBtn then
      UIUtil.SetBtnText(sureBtn, sureBtnParam.titleText or T(302), sureBtnParam.subTitleText or T(303))
      sureBtn.onClick:Set(sureBtnParam.touchCallback)
    end
    local cancelBtn = btnGroupObject:GetChild("Popup_S_Black_Btn")
    if cancelBtn then
      UIUtil.SetBtnText(cancelBtn, cancelBtnParam.titleText or T(10052), cancelBtnParam.subTitleText or T(10053))
      cancelBtn.onClick:Set(cancelBtnParam.touchCallback)
    end
  elseif sureBtnParam then
    ChangeUIController(btnGroupObject, "c1", 2)
    local sureBtn = btnGroupObject:GetChild("Popup_B_Green_Btn")
    if sureBtn then
      UIUtil.SetBtnText(sureBtn, sureBtnParam.titleText or T(302), sureBtnParam.subTitleText or T(303))
      sureBtn.onClick:Set(sureBtnParam.touchCallback)
    end
  else
    ChangeUIController(btnGroupObject, "c1", 0)
  end
end

function UIUtil.SetTagButtonSwitch(btn, trans, switchFun, callback, rootObject)
  if trans and callback and btn and switchFun then
    btn.onClick:Set(function()
      local bol = switchFun()
      if bol then
        if rootObject then
          rootObject.touchable = false
        end
        trans:Play(function()
          if rootObject then
            rootObject.touchable = true
          end
        end)
        trans:SetHook("Switch", callback)
      end
    end)
  end
end

function UIUtil.InitAssetsTips(list, tipsData, autoWidth)
  local canNotTouchId = {
    COMMON_ITEM_ID.ENERGY,
    COMMON_ITEM_ID.RECHARGE_DIAMOND,
    COMMON_ITEM_ID.BIND_DIAMOND,
    COMMON_ITEM_ID.ABYSS_COIN_A,
    COMMON_ITEM_ID.ABYSS_COIN_B
  }
  list.numItems = 0
  local width = 0
  
  function list.itemRenderer(i, item)
    width = item.width
    local itemId = tipsData[i + 1]
    if not table.contain(canNotTouchId, itemId) then
      ChangeUIController(item, "c1", 1)
    else
      ChangeUIController(item, "c1", 0)
      item:GetChild("AssetsBtn").onClick:Set(function()
        UIUtil.ClickAssetItem(itemId)
      end)
    end
    local count = ActorData.GetItemCount(itemId)
    UIUtil.SetIconById(item:GetChild("IconLoader"), itemId, true)
    UIUtil.SetText(item, UIUtil.GetFormatCount(count), "NumberTxt")
  end
  
  list.numItems = #tipsData
  if autoWidth then
    list:SetPivot(1, 0, false)
    list:Center()
    width = width + list.columnGap
    list:SetSize(math.min(list.width, width * #tipsData + list.columnGap), list.height)
  end
end

function UIUtil.ClickAssetItem(itemId)
  if itemId == COMMON_ITEM_ID.RECHARGE_DIAMOND then
    CurrencyReturnWindow.jumpShop(false, nil, 2)
  elseif itemId == COMMON_ITEM_ID.ENERGY then
    ld("Energy", function()
      EnergyService.GetEnergyRecoverInfoReq()
    end)
  elseif itemId == COMMON_ITEM_ID.BIND_DIAMOND then
    if ActorData.GetItemCount(COMMON_ITEM_ID.RECHARGE_DIAMOND) < 1 then
      OpenWindow(WinResConfig.DiamondWindow.name)
      return
    end
    OpenWindow(WinResConfig.MainOpalExchangeWindow.name)
  elseif itemId == COMMON_ITEM_ID.ABYSS_COIN_A or itemId == COMMON_ITEM_ID.ABYSS_COIN_B then
    OpenWindow(WinResConfig.ItemGetTipsWindow.name, nil, {id = itemId})
  end
end

function UIUtil.GetFormatCount(count)
  local language = Language.curLanguage
  if language == LANGUAGE_ENUM.CN then
    return UIUtil.FormatCountType1(count)
  elseif language == LANGUAGE_ENUM.JP then
    return UIUtil.FormatCountType2(count)
  elseif language == LANGUAGE_ENUM.TC then
    return UIUtil.FormatCountType1(count)
  else
    return UIUtil.FormatCountType2(count)
  end
end

function UIUtil.FormatCountType1(count)
  if count >= 100000000 then
    local num = count / 10000000
    if num % 10 < 1 then
      return T(11101, math.floor(num / 10))
    else
      return T(11101, math.floor(num) / 10)
    end
  elseif count >= 10000 then
    local num = count / 1000
    if num % 10 < 1 then
      return T(11100, math.floor(num / 10))
    else
      return T(11100, math.floor(num) / 10)
    end
  else
    return count
  end
end

function UIUtil.FormatCountType2(count)
  if count >= 1000000000 then
    local num = count / 100000000
    if num % 10 < 1 then
      return T(11102, math.floor(num / 10))
    else
      return T(11102, math.floor(num) / 10)
    end
  elseif count >= 1000000 then
    local num = count / 100000
    if num % 10 < 1 then
      return T(11103, math.floor(num / 10))
    else
      return T(11103, math.floor(num) / 10)
    end
  elseif count >= 1000 then
    local num = count / 100
    if num % 10 < 1 then
      return T(11104, math.floor(num / 10))
    else
      return T(11104, math.floor(num) / 10)
    end
  else
    return count
  end
end

function UIUtil.SetText(gobject, text, childName)
  if gobject and text then
    local btnText = gobject:GetChild(childName or "NameTxt") or gobject:GetChild("WordTxt")
    if btnText then
      btnText.text = text
    end
  end
end

function UIUtil.SetBtnText(btn, text, subTitleText)
  if btn and text then
    local nameTxt = btn:GetChild("NameTxt") or btn:GetChild("WordTxt")
    if nameTxt then
      nameTxt.text = text
    end
    if subTitleText then
      local subTitleTxt = btn:GetChild("SubtitleTxt")
      if subTitleTxt then
        subTitleTxt.text = subTitleText
      end
    end
    local buttonShadow = btn:GetChild("ButtonShadow")
    if buttonShadow then
      buttonShadow:GetChild("WordTxt").text = text
    end
  end
end

function UIUtil.ShowElementList(elementList, config)
  if nil == elementList or nil == config then
    return
  end
  
  function elementList.itemRenderer(i, item)
    ChangeUIController(item, nil, config.element_type[i + 1])
  end
  
  if config.element_type then
    elementList.numItems = #config.element_type
  else
    elementList.numItems = 0
  end
end

function UIUtil.ShowItemFrame(itemId, itemObject, count, itemInfo, touchCallback, showHeadWord)
  local itemConfig = TableData.GetConfig(itemId, "BaseItem") or TableData.GetConfig(itemId, "BaseSound")
  local type = 0
  if nil == itemConfig then
    itemConfig = TableData.GetConfig(itemId, "BaseCard")
    type = 1
    if nil == itemConfig then
      itemConfig = TableData.GetConfig(itemId, "BaseFashion")
      type = 2
      if nil == itemConfig then
        itemConfig = TableData.GetConfig(itemId, "BaseBadge")
        type = 3
        if nil == itemConfig then
          return
        end
      end
    end
  end
  local loader, clickHand
  if 0 == type then
    loader = itemObject:GetChild("ItemLoader")
    clickHand = loader
    loader.url = UIUtil.GetResUrl(itemConfig.icon)
    if count then
      local numberTxt = itemObject:GetChild("NumberTxt")
      if itemConfig.unlock_des then
        numberTxt.text = itemConfig.unlock_des()
      elseif (itemConfig.type == ProtoEnum.ITEM_TYPE.HEAD_RECT_ITEM or itemConfig.type == ProtoEnum.ITEM_TYPE.EMOJI) and showHeadWord then
        numberTxt.text = showHeadWord
      else
        numberTxt.text = count
      end
      ChangeUIController(itemObject, "number", 0)
    else
      ChangeUIController(itemObject, "number", 1)
    end
    ChangeUIController(itemObject, "c1", itemConfig.quality)
    ChangeUIController(itemObject, "type", 0)
    ChangeUIController(itemObject, "badge", 0)
  elseif 3 == type then
    loader = itemObject:GetChild("ItemLoader")
    clickHand = loader
    loader.url = UIUtil.GetResUrl(itemConfig.icon)
    if count then
      local numberTxt = itemObject:GetChild("NumberTxt")
      numberTxt.text = count
      ChangeUIController(itemObject, "number", 0)
    else
      ChangeUIController(itemObject, "number", 1)
    end
    ChangeUIController(itemObject, "c1", itemConfig.star - 1)
    ChangeUIController(itemObject, "type", 0)
    local badgeInfo = itemInfo
    if badgeInfo and 0 ~= badgeInfo.wearCardId then
      local wearCardInfo = CardData.GetCardDataById(badgeInfo.wearCardId)
      local loader = itemObject:GetChild("BadgeHeadShow"):GetChild("HeadShowBg"):GetChild("PicLoader")
      if wearCardInfo then
        UIUtil.SetHeadByFaceId(wearCardInfo.fashionId, loader, HEAD_ICON_TYPE_ENUM.RECT)
      end
      ChangeUIController(itemObject, "badge", 1)
    else
      ChangeUIController(itemObject, "badge", 0)
    end
  else
    clickHand = itemObject:GetChild("ItemCardPic")
    loader = clickHand:GetChild("ItemLoader")
    if 2 == type then
      if itemConfig.head_icon_rect and loader then
        loader.url = UIUtil.GetResUrl(itemConfig.head_icon_rect)
      end
      if itemConfig.card_id then
        local cardData = TableData.GetConfig(itemConfig.card_id, "BaseCard")
        if cardData then
          ChangeUIController(itemObject, "c1", cardData.star - 1)
        end
      end
    elseif 1 == type then
      local fashionId = itemConfig.fashion_id
      ChangeUIController(itemObject, "c1", itemConfig.star - 1)
      UIUtil.SetHeadByFaceId(fashionId, loader, HEAD_ICON_TYPE_ENUM.RECT)
    end
    ChangeUIController(itemObject, "type", type)
    ChangeUIController(itemObject, "badge", 0)
  end
  if itemInfo and 0 == type then
    if 0 ~= itemInfo.expireStamp then
      ChangeUIController(itemObject, "c2", 1)
      local timeTxt = itemObject:GetChild("ItemTime"):GetChild("TimeTxt")
      timeTxt.text = TimeUtil.FormatEnTime(itemInfo.expireStamp - LoginData.GetCurServerTime())
    else
      ChangeUIController(itemObject, "c2", 0)
    end
  else
    ChangeUIController(itemObject, "c2", 0)
  end
  if touchCallback and clickHand then
    clickHand.onClick:Set(touchCallback)
  end
end

function UIUtil.CommonItemClickCallback(itemId, itemType, badgeUid, notShowWay)
  UIUtil.OpenPreviewTips(itemId, itemType, badgeUid, notShowWay)
end

function UIUtil.ShowBuildingHeadBtn(buildingId, headBtn, touchCallback)
  local buildingConfig = TableData.GetConfig(buildingId, "BaseBuilding")
  if buildingConfig and buildingConfig.head_icon_square then
    local loader = headBtn:GetChild("BuildType"):GetChild("PicLoader")
    if loader then
      loader.url = UIUtil.GetResUrl(buildingConfig.head_icon_square)
    end
    ChangeUIController(headBtn, "c1", buildingConfig.star)
    if touchCallback then
      loader.onClick:Set(touchCallback)
    end
  end
end

function UIUtil.ShowHeadBtn(cardId, headBtn, cardInfo, touchCallback, headIconType)
  local fashionId
  local baseConfig, isMonster = CardData.GetBaseConfig(cardId)
  if cardInfo then
    fashionId = cardInfo.fashionId
  else
    fashionId = baseConfig.fashion_id
  end
  local loader
  if isMonster then
    ChangeUIController(headBtn, "c2", 1)
    local head = headBtn:GetChild("MonsterLoader")
    if head then
      loader = head:GetChild("PicLoader")
      UIUtil.SetHeadByFaceId(fashionId, loader)
    end
    local monsterSign = headBtn:GetChild("MonsterSign")
    if monsterSign then
      ChangeUIController(monsterSign, "c1", baseConfig.rank)
      local rankNameTxt = monsterSign:GetChild("NameTxt")
      if rankNameTxt then
        rankNameTxt.text = CardData.GetMonsterRankName(baseConfig.rank)
      end
    end
  else
    ChangeUIController(headBtn, "c2", 0)
    local head = headBtn:GetChild("PlayerHead") or headBtn:GetChild("CardPic")
    if head then
      loader = head:GetChild("PicLoader") or head:GetChild("CardPicLoader")
      UIUtil.SetHeadByFaceId(fashionId, loader, headIconType)
    end
  end
  if cardInfo then
    ChangeUIController(headBtn, "c1", cardInfo.quality)
  else
    ChangeUIController(headBtn, "c1", baseConfig.star)
  end
  if touchCallback then
    headBtn.onClick:Set(touchCallback)
  end
end

function UIUtil.ShowPlayerHead(actorInfo, head, touchCallback)
  local headFashionId = 0
  local headItemId = 0
  local headRectItemId = 0
  local headInfo = actorInfo.actorHead
  if headInfo then
    if 0 ~= headInfo.fashionId then
      headFashionId = headInfo.fashionId
    elseif 0 ~= headInfo.headId then
      headItemId = headInfo.headId
    end
    if 0 ~= headInfo.headRectId then
      headRectItemId = headInfo.headRectId
    end
  end
  if 0 == headFashionId and 0 == headItemId then
    headFashionId = actorInfo.faceId
  end
  if 0 == headRectItemId then
    ChangeUIController(head, "c1", 0)
  else
    local headFrameLoader = head:GetChild("FrameLoader")
    local headRectItemConfig = TableData.GetConfig(headRectItemId, "BaseItem")
    if headRectItemConfig then
      headFrameLoader.url = UIUtil.GetResUrl(headRectItemConfig.icon)
      ChangeUIController(head, "c1", 1)
    end
  end
  local headBg = head:GetChild("HeadBg")
  if headBg then
    local loader = headBg:GetChild("PicLoader")
    if headFashionId > 0 then
      UIUtil.SetHeadByFaceId(headFashionId, loader, HEAD_ICON_TYPE_ENUM.RECT)
    elseif headItemId > 0 then
      local headItemConfig = TableData.GetConfig(headItemId, "BaseItem")
      if headItemConfig then
        loader.url = UIUtil.GetResUrl(headItemConfig.icon)
      end
    end
  end
  if touchCallback then
    head.touchable = true
    head.onClick:Set(touchCallback)
  else
    head.touchable = false
  end
end

function UIUtil.ShowCardTips(cardInfo, cardTips, touchCallback, params, headType, showBreachEffect)
  local id = cardInfo.cardId or cardInfo.id
  local data = SimpleCopy(cardInfo)
  local configData, isMonster = CardData.GetBaseConfig(id)
  if data.level == nil and isMonster then
    data = CardData.CreateClientUnit(id)
  end
  if isMonster then
    ChangeUIController(cardTips, "c1", 1)
  else
    ChangeUIController(cardTips, "c1", 0)
  end
  local starList = cardTips:GetChild("StarList")
  if starList then
    UIUtil.ShowStarList(starList, data, configData)
  end
  local lvId, lvData
  local nameTxt = cardTips:GetChild("CardNameTxt") or cardTips:GetChild("NameTxt")
  if nameTxt then
    nameTxt.text = configData.name()
  end
  local elementList = cardTips:GetChild("ElementList")
  UIUtil.ShowElementList(elementList, configData)
  local occupation = cardTips:GetChild("Occupation")
  if occupation then
    ChangeUIController(occupation, nil, configData.type - 1)
    ChangeUIController(occupation, "c2", 1)
  end
  local quality = cardTips:GetChild("Quality")
  if quality then
    ChangeUIController(quality, nil, configData.star - 1)
  end
  quality = cardTips:GetChild("Quality1_1")
  if quality then
    ChangeUIController(quality, nil, configData.star - 1)
  end
  quality = cardTips:GetChild("Quality1_2")
  if quality then
    ChangeUIController(quality, nil, configData.star - 1)
  end
  local breach = cardTips:GetChild("CardBreach") or cardTips:GetChild("Breach")
  if breach then
    ChangeUIController(breach, "c1", data.quality)
    if showBreachEffect then
      ChangeUIController(breach, "c2", 1)
      local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_break_level.prefab")
      UIUtil.SetObjectToUI(effect, breach:GetChild("BreachHolder"))
      local breachLv
      for i = 1, 3 do
        breachLv = LuaUtil.FindChild(effect.transform, "level_grp_" .. i, true)
        if breachLv then
          breachLv.gameObject:SetActive(i <= data.quality)
        end
      end
    else
      ChangeUIController(breach, "c2", 0)
    end
  end
  local levelTxt = cardTips:GetChild("CardLvTxt") or cardTips:GetChild("LevelTxt")
  if levelTxt then
    if configData.grow_model_id then
      lvId = configData.grow_model_id * 1000 + data.level
      lvData = TableData.GetConfig(lvId, "BaseCardLevelUp")
      if headType then
        levelTxt.text = HEAD_ICON_TYPE_ENUM.SQUARE == headType and T(1120, lvData.level_show) or T(1119, lvData.level_show)
      else
        levelTxt.text = T(535, lvData.level_show)
      end
    else
      levelTxt.text = T(535, data.level)
    end
  end
  local cardPic = cardTips:GetChild("CardPic")
  if cardPic then
    local fashionId = 0 == data.fashionId and configData.fashion_id or data.fashionId
    UIUtil.SetHeadByFaceId(fashionId, cardPic:GetChild("CardPicLoader") or cardPic:GetChild("PicLoader"), headType)
  end
  if touchCallback then
    cardTips.onClick:Set(touchCallback)
  end
  local gotoBtn = cardTips:GetChild("GoToBtn")
  if gotoBtn then
    gotoBtn.visible = data.cardId ~= nil
    gotoBtn.onClick:Add(function()
      InfoTipsUtil.CloseTips(cardTips)
      CardMgr.InitCtrIndex()
      OpenWindow(WinResConfig.CardDetailsWindow.name, nil, id)
    end)
  end
  local moduleList = cardTips:GetChild("ModuleList")
  if moduleList then
    moduleList:RemoveChildrenToPool()
    local url = UIUtil.GetResUrl("Formation:CardAttributeModule")
    local cardAttributeModule = moduleList:AddItemFromPool(url)
    UIUtil.SetBtnText(cardAttributeModule:GetChild("TitleBtn"), T(31), T(33))
    local attributeList = cardAttributeModule:GetChild("ContentList")
    if attributeList then
      local displayAttributeTable = {
        {
          id = ProtoEnum.ATTR_ID.MAX_HP,
          name = T(80000102),
          index = 0
        },
        {
          id = ProtoEnum.ATTR_ID.ATK,
          name = T(80000103),
          index = 1
        },
        {
          id = ProtoEnum.ATTR_ID.DEF,
          name = T(80000104),
          index = 2
        }
      }
      local attrData = CardData.CalculatorCardAttr(data, params)
      attributeList:RemoveChildrenToPool()
      for i, v in ipairs(displayAttributeTable) do
        local attribute = attributeList:AddItemFromPool()
        attribute:GetChild("NameTxt").text = v.name
        attribute:GetChild("NumberTxt").text = attrData[v.id]
        ChangeUIController(attribute, nil, v.index)
      end
      attributeList:ResizeToFit()
    end
    local skill2Level = data.skill2Level
    if nil == skill2Level then
      skill2Level = CardData.GetConfigSkill(configData)
    end
    local skillConfig
    local displaySkillTable = {}
    for skillId, skillLevel in pairs(skill2Level) do
      skillConfig = TableData.GetConfig(skillId, "BaseSkill")
      if skillConfig.type == SKILL_TYPE_ENUM.SMALL or skillConfig.type == SKILL_TYPE_ENUM.UNIQUE or skillConfig.type == SKILL_TYPE_ENUM.EX then
        table.insert(displaySkillTable, {
          id = skillId,
          type = skillConfig.type,
          level = skillLevel
        })
      end
    end
    if #displaySkillTable > 0 then
      table.sort(displaySkillTable, function(a, b)
        if a.type == b.type then
          return a.id < b.id
        end
        return a.type > b.type
      end)
      url = UIUtil.GetResUrl("Formation:CardSkillModule")
      local cardSkillModule = moduleList:AddItemFromPool(url)
      UIUtil.SetBtnText(cardSkillModule:GetChild("TitleBtn"), T(32), T(34))
      local skillList = cardSkillModule:GetChild("ContentList")
      if skillList then
        local skillItemUrl
        if isMonster then
          skillItemUrl = UIUtil.GetResUrl("Formation:MonsterSkillDescribe")
        else
          skillItemUrl = UIUtil.GetResUrl("Formation:CardSkillDescribe")
        end
        for _, v in ipairs(displaySkillTable) do
          local item = skillList:AddItemFromPool(skillItemUrl)
          UIUtil.ShowCardSkill(item, v.id, v.level)
        end
        skillList:ResizeToFit()
      end
    end
  end
end

function UIUtil.ShowBuildingTips(buildingId, buildingTips, touchCallback, params)
  local configData = TableData.GetConfig(buildingId, "BaseBuilding")
  local nameTxt = buildingTips:GetChild("NameTxt")
  if nameTxt then
    nameTxt.text = configData.name()
  end
  local desTxt = buildingTips:GetChild("WordTxt")
  if desTxt then
    desTxt.text = configData.des()
  end
  local moduleList = buildingTips:GetChild("ModuleList")
  moduleList:RemoveChildrenToPool()
  local url, cardData
  local monsterId = configData.monster_id
  local monsterConfig
  if monsterId then
    monsterConfig = TableData.GetConfig(monsterId, "BaseMonster")
    local elementList = buildingTips:GetChild("ElementList")
    UIUtil.ShowElementList(elementList, monsterConfig)
    cardData = CardData.CreateClientUnit(monsterId)
  end
  url = UIUtil.GetResUrl("Formation:BuildAttributeModule")
  local buildAttributeModule = moduleList:AddItemFromPool(url)
  local attributeList = buildAttributeModule:GetChild("ContentList")
  if attributeList then
    local displayAttributeTable
    displayAttributeTable = {
      {
        text = math.floor(configData.range[1] / 80) .. "x" .. math.floor(configData.range[2] / 80),
        name = T(10403),
        index = 0
      },
      {
        text = configData.cost,
        name = T(10404),
        index = 1,
        visible = params and params.arenaDefense == true
      },
      {
        id = ProtoEnum.ATTR_ID.MAX_HP,
        name = T(80000102),
        index = 2,
        visible = nil ~= cardData
      }
    }
    local attrData
    if cardData then
      cardData.id = buildingId
      attrData = CardData.CalculatorCardAttr(cardData)
    end
    attributeList:RemoveChildrenToPool()
    for i, v in ipairs(displayAttributeTable) do
      if v.visible == nil or v.visible == true then
        local attribute = attributeList:AddItemFromPool()
        attribute:GetChild("NameTxt").text = v.name
        if v.id then
          attribute:GetChild("NumberTxt").text = attrData[v.id]
        elseif v.text then
          attribute:GetChild("NumberTxt").text = v.text
        end
        ChangeUIController(attribute, nil, v.index)
      end
    end
    attributeList:ResizeToFit()
  end
  url = UIUtil.GetResUrl("Formation:BuildDescribeModule")
  local buildDescribeModule = moduleList:AddItemFromPool(url)
  UIUtil.SetBtnText(buildDescribeModule:GetChild("TitleBtn"), T(10401), T(10402))
  buildDescribeModule:GetChild("WordTxt").text = configData.remark()
  if touchCallback then
    buildingTips.onClick:Set(touchCallback)
  end
end

function UIUtil.ShowStarList(starList, data, config)
  local maxStar = math.max(data.grade, config.star)
  
  function starList.itemRenderer(index, item)
    if index + 1 <= data.grade then
      ChangeUIController(item, "c1", 1)
    else
      ChangeUIController(item, "c1", 0)
    end
  end
  
  starList.numItems = maxStar
end

function UIUtil.ShowCardSkill(skillItem, skillId, skillLevel)
  local skillConfig = TableData.GetConfig(skillId, "BaseSkill")
  local isUnlock = false
  if skillLevel then
    isUnlock = true
    UIUtil.SetText(skillItem, T(244, skillLevel), "LevelTxt")
  else
    UIUtil.SetText(skillItem, "", "LevelTxt")
  end
  local loader = skillItem:GetChild("IconLoader")
  if loader then
    loader.url = UIUtil.GetResUrl(skillConfig.icon)
  end
  local name = skillItem:GetChild("NameTxt")
  if name then
    name.text = skillConfig.name()
  end
  local skill = skillItem:GetChild("Skill")
  if skill then
    loader = skill:GetChild("IconLoader")
    if loader then
      loader.url = UIUtil.GetResUrl(skillConfig.icon)
    end
    ChangeUIController(skill, "c2", skillConfig.show_type)
  end
  local skillType = skillItem:GetChild("SkillType") or skillItem:GetChild("SkillDetailsTag")
  if skillType then
    UIUtil.SetText(skillType, CardData.GetSkillTypeName(skillConfig.type), "WordTxt")
    if skillConfig.type == SKILL_TYPE_ENUM.SMALL then
      ChangeUIController(skillType, "c1", 1)
    elseif skillConfig.type == SKILL_TYPE_ENUM.BURST_CARD then
      ChangeUIController(skillType, "c1", 2)
    elseif skillConfig.type == SKILL_TYPE_ENUM.LEADER then
      ChangeUIController(skillType, "c1", 3)
    else
      ChangeUIController(skillType, "c1", 0)
    end
  end
  local upList = skillItem:GetChild("SkillUpList")
  if upList then
    upList:RemoveChildrenToPool()
    for i = 1, 3 do
      local one = upList:AddItemFromPool()
      if false == isUnlock or i > skillLevel + 1 then
        ChangeUIController(one, "c1", 0)
      elseif i <= skillLevel + 1 then
        ChangeUIController(one, "c1", 1)
      end
    end
  end
  local wordTxt = skillItem:GetChild("WordTxt")
  if wordTxt then
    local skillLevelUpConfig = TableData.GetConfig(skillId * 1000 + (skillLevel or 1), "BaseSkillLevelUp")
    wordTxt.text = skillLevelUpConfig.des and skillLevelUpConfig.des()
  end
  local skillCd = skillItem:GetChild("SkillCD")
  if skillCd then
    if skillConfig.cd then
      UIUtil.SetText(skillCd, T(1121, skillConfig.cd), "WordTxt")
      ChangeUIController(skillItem, "c1", 1)
      wordTxt:SetSize(wordTxt.width, wordTxt.height + 29)
    else
      ChangeUIController(skillItem, "c1", 0)
    end
  else
    ChangeUIController(skillItem, "c1", isUnlock and 0 or 1)
  end
end

function UIUtil.SetExpeditionCardList(list, card2pos, cardUsedLimit, stageConfig, curTeamIndex)
  if list then
    if nil == cardUsedLimit then
      local mapList = stageConfig.expedition_map_list
      local config = TableData.GetConfig(mapList[curTeamIndex], "BaseExpeditionMap")
      cardUsedLimit = config.role_num
    end
    if nil == card2pos then
      card2pos = {}
      local prepareInfo = FormationData.GetStagePrepareInfo(ProtoEnum.SCENE_TYPE.EXPEDITION, stageConfig.id)
      local specialArray = prepareInfo and prepareInfo.specialArray
      if specialArray then
        for _, v in pairs(specialArray) do
          if v.index == curTeamIndex then
            card2pos = SimpleCopy(v.cardUid2Pos)
          end
        end
      end
    end
    local cardDataList = CardData.SortTeamCardList(card2pos)
    
    function list.itemRenderer(index, hand)
      if index < cardUsedLimit then
        local data = cardDataList[index + 1]
        if data then
          ChangeUIController(hand, "c1", 0)
          local loader = hand:GetChild("HeadBg"):GetChild("PicLoader")
          local cardData = data.cardData
          UIUtil.SetHeadByFaceId(cardData.fashionId, loader, HEAD_ICON_TYPE_ENUM.RECT)
        else
          ChangeUIController(hand, "c1", 1)
        end
      else
        ChangeUIController(hand, "c1", 2)
      end
    end
    
    list.numItems = 8
    return #cardDataList, cardUsedLimit
  end
end

function UIUtil.ShowCardSkillDes(skillId, skillLevel)
  if skillId then
    OpenWindow(WinResConfig.SkillTipsWindow.name, nil, {id = skillId, lv = skillLevel})
  end
end

function UIUtil.SetObjectToUI(gameObject, holder, scaleRatio, cloneMaterial)
  local wrapper
  if cloneMaterial then
    wrapper = FairyGUI.GoWrapper()
    wrapper:SetWrapTarget(gameObject, cloneMaterial)
  else
    wrapper = FairyGUI.GoWrapper(gameObject)
  end
  holder:SetNativeObject(wrapper)
  local scale = 1 / Const.DefaultUIScale
  local name = gameObject.name
  if string.find(name, "cardspine_") or string.find(name, "npcspine_") or string.find(name, "npc_texture_") then
    scale = scale * Const.DefaultShowSpineScale
  end
  if scaleRatio then
    scale = scale * scaleRatio / 10000
  end
  LuaUtil.SetScale(gameObject, scale, scale, scale)
  return wrapper
end

function UIUtil.AddEffectToUITop(effectPath, component, scale, autoDestroy, destroyCallback)
  local holder = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
  component:AddChild(holder)
  holder:SetPivot(0.5, 0.5, true)
  holder:Center()
  return UIUtil.SetEffectToUI(effectPath, holder, scale, autoDestroy, destroyCallback), holder
end

function UIUtil.SetEffectToUI(effectPath, holder, scale, autoDestroy, destroyCallback)
  local effect = ResourceManager.Instantiate(effectPath)
  if nil == effect then
    return
  end
  UIUtil.SetObjectToUI(effect, holder)
  if scale then
    LuaUtil.SetScale(effect, scale, scale, scale, true)
  end
  if autoDestroy then
    EffectUtil.SetAutoDestroyCallback(effect, function()
      if IsNil(effect) == false and IsNil(holder) == false then
        holder:SetNativeObject(nil)
      end
      if destroyCallback then
        destroyCallback()
      end
    end)
  end
  return effect
end

function UIUtil.SetCardBattleSpine(spinePath, holder, state, loop, scale, isAsync, loadComplete, stateComplete)
  if true == isAsync then
    ResourceManager.InstantiateAsync(spinePath, function(model)
      if nil == model then
        return
      end
      if IsNil(holder) or nil == holder.parent then
        ResourceManager.DestroyGameObject(model)
        return
      end
      if loadComplete then
        loadComplete(model)
      end
      UIUtil.SetObjectToUI(model, holder)
      UIUtil.InitSpineSetting(model, state, loop, scale, stateComplete)
    end)
  else
    local model = ResourceManager.Instantiate(spinePath)
    if nil == model then
      return
    end
    if loadComplete then
      loadComplete(model)
    end
    UIUtil.SetObjectToUI(model, holder)
    UIUtil.InitSpineSetting(model, state, loop, scale, stateComplete)
    return model
  end
end

function UIUtil.InitSpineSetting(gameObject, state, loop, scale, stateComplete)
  if IsNil(gameObject) then
    return
  end
  if stateComplete then
    if SkeletonAnimationUtil.GetSkeletonAnimation(gameObject) then
      SkeletonAnimationUtil.SetAnimation(gameObject, 0, state, loop, 0, function()
        if IsNil(gameObject) == false then
          stateComplete(gameObject)
        end
      end)
    else
      local animations = gameObject:GetComponentsInChildren(typeof(SkeletonAnimation), true)
      for i = 0, animations.Length - 1 do
        if 0 == i then
          SkeletonAnimationUtil.SetAnimation(animations[i].gameObject, 0, state, loop, 0, function()
            if IsNil(gameObject) == false then
              stateComplete(gameObject)
            end
          end)
        else
          SkeletonAnimationUtil.SetAnimation(animations[i].gameObject, 0, state, loop)
        end
      end
    end
  elseif SkeletonAnimationUtil.GetSkeletonAnimation(gameObject) then
    SkeletonAnimationUtil.SetAnimation(gameObject, 0, state, loop)
  else
    local animations = gameObject:GetComponentsInChildren(typeof(SkeletonAnimation), true)
    for i = 0, animations.Length - 1 do
      SkeletonAnimationUtil.SetAnimation(animations[i].gameObject, 0, state, loop)
    end
  end
  if scale then
    LuaUtil.SetScale(gameObject, scale, scale, scale, true)
  end
end

local SetCardShowSpine = function(cardShowHolder, fashionId, isAsync, loadComplete, ignoreTimeScale)
  if nil == isAsync then
    isAsync = true
  end
  local fashionConfig = TableData.GetConfig(fashionId, "BaseFashion")
  if fashionConfig and fashionConfig.show_spine then
    if true == isAsync then
      ResourceManager.InstantiateAsync(ModelUtil.GetFullPath(fashionConfig.show_spine, RES_PATH_PREFIX.CARD_SHOW_SPINE), function(cardShowObject, loader, holder)
        SkeletonAnimationUtil.SetShaderEffectEnable(cardShowObject, false, false, false)
        if ignoreTimeScale then
          cardShowObject:IgnoreTimeScale(true)
        end
        if loadComplete then
          loadComplete(cardShowObject)
        end
        UIUtil.SetObjectToUI(cardShowObject, holder)
        if fashionConfig.show_spine_position then
          LuaUtil.SetLocalPos(cardShowObject, fashionConfig.show_spine_position[1], fashionConfig.show_spine_position[2], 0)
        end
      end, nil, cardShowHolder)
    else
      local cardShowObject = ResourceManager.Instantiate(ModelUtil.GetFullPath(fashionConfig.show_spine, RES_PATH_PREFIX.CARD_SHOW_SPINE))
      SkeletonAnimationUtil.SetShaderEffectEnable(cardShowObject, false, false, false)
      if loadComplete then
        loadComplete(cardShowObject)
      end
      local wrapper = UIUtil.SetObjectToUI(cardShowObject, cardShowHolder)
      if fashionConfig.show_spine_position then
        LuaUtil.SetLocalPos(cardShowObject, fashionConfig.show_spine_position[1], fashionConfig.show_spine_position[2], 0)
      end
      return cardShowObject, wrapper
    end
  end
end

function UIUtil.SetCardShowSpineAutoAlpha(fashionId, cardShowLoader, cardShowHolder, noAlphaChange, loadComplete, autoAlphaTime, ignoreTimeScale)
  if noAlphaChange then
    SetCardShowSpine(cardShowHolder, fashionId, true, loadComplete, ignoreTimeScale)
    return
  end
  if nil == cardShowLoader or nil == cardShowHolder then
    return
  end
  local fashionConfig = TableData.GetConfig(fashionId, "BaseFashion")
  if fashionConfig and fashionConfig.show_spine then
    ResourceManager.InstantiateAsync(ModelUtil.GetFullPath(fashionConfig.show_spine, RES_PATH_PREFIX.CARD_SHOW_SPINE), function(cardShowObject, loader, holder)
      if IsNil(loader) or IsNil(holder) then
        ResourceManager.DestroyGameObject(cardShowObject)
        return
      end
      SkeletonAnimationUtil.SetShaderEffectEnable(cardShowObject, false, false, false)
      if loadComplete then
        loadComplete(cardShowObject)
      end
      local configX = fashionConfig.show_spine_position[1]
      local configY = fashionConfig.show_spine_position[2]
      local inLoaderX = configX - loader.width / 2
      local inLoaderY = configY + loader.height / 2
      local inHolderX = configX
      local inHolderY = configY
      local inLoaderScale = 100
      local inHolderScale = Const.DefaultShowSpineScale / Const.DefaultUIScale
      CS.CardSpineHelper.Init(cardShowObject, loader, holder, inLoaderX, inLoaderY, inHolderX, inHolderY, inLoaderScale, inHolderScale, autoAlphaTime or 0)
    end, cardShowLoader, cardShowHolder)
  end
end

function UIUtil.SetCardShowTexture(cardShowLoader, fashionId)
  local fashionConfig = TableData.GetConfig(fashionId, "BaseFashion")
  if fashionConfig and fashionConfig.show_texture then
    local texture = ResourceManager.LoadTexture(ModelUtil.GetFullPath(fashionConfig.show_texture, RES_PATH_PREFIX.CARD_TEXTURE))
    if texture then
      UIUtil.SetLoaderTexture(cardShowLoader, texture)
    end
  end
end

function UIUtil.SetCardShowToLoader(cardShowLoader, fashionId)
  local fashionConfig = TableData.GetConfig(fashionId, "BaseFashion")
  if fashionConfig and fashionConfig.show_spine then
    ResourceManager.InstantiateAsync(ModelUtil.GetFullPath(fashionConfig.show_spine, RES_PATH_PREFIX.CARD_SHOW_SPINE), function(cardShowObject)
      SkeletonAnimationUtil.SetShaderEffectEnable(cardShowObject, false, false, false)
      RTManager:ShowModelToLoader(cardShowLoader, cardShowObject, 2, 1, 0, RTManager.cameraFovScale)
      local configX = fashionConfig.show_spine_position[1]
      local configY = fashionConfig.show_spine_position[2]
      local inLoaderX = configX - cardShowLoader.width / 2
      local inLoaderY = configY + cardShowLoader.height / 2
      local inLoaderScale = 100
      LuaUtil.SetScale(cardShowObject, inLoaderScale, inLoaderScale, inLoaderScale)
      LuaUtil.SetLocalPos(cardShowObject, inLoaderX, inLoaderY, 0)
      LeanTween.delayedCall(0.1, function()
        RTManager:StopCamera2Loader(cardShowLoader)
      end)
    end)
  end
end

function UIUtil.SetSfxClipInList(sfx, list)
  if nil == sfx then
    return
  end
  local renderS = sfx:GetComponentsInChildren(typeof(Renderer))
  local count = renderS.Length
  for i = 0, count - 1 do
    local render = renderS[i]
    local mat = render.material
    mat:EnableKeyword("CLIPPED")
    mat:SetFloat(FairyGUI.ShaderConfig.IDs._BlendSrcFactor, 5)
    mat:SetVector(FairyGUI.ShaderConfig.IDs._ClipBox, Util.GetListClipArea(list))
  end
end

function UIUtil.GetHeadUrl(fashionId)
  return UIUtil.GetResUrl("ItemIcon:1000004")
end

function UIUtil.SetHeadByFaceId(faceId, loader, headIconType)
  local headData = TableData.GetConfig(faceId, "BaseFashion")
  if headData and loader then
    if nil == headIconType then
      headIconType = HEAD_ICON_TYPE_ENUM.SQUARE
    end
    if headData[headIconType] then
      loader.url = UIUtil.GetResUrl(headData[headIconType])
    end
  end
end

function UIUtil.SetPrice(price, text, loader)
  local arr = Split(price, ":")
  if 3 == #arr then
    UIUtil.SetIconById(loader, tonumber(arr[2]))
    if text then
      text.text = arr[3]
    end
  end
end

function UIUtil.SetHolderCenter(Holder, pivotX, pivotY)
  if Holder then
    local x = pivotX or 0.5
    local y = pivotY or 0.5
    Holder:SetPivot(x, y, true)
    Holder:Center()
  end
end

function UIUtil.ChangeLoginScreenEffectIn(callback, dontShowEffect)
  if Net.isReconnectOk then
    callback()
    return
  end
  if UIMgr:IsWindowOpen(WinResConfig.LoginLoadingWindow.name) and callback then
    UIMgr:SendWindowMessage(WinResConfig.LoginLoadingWindow.name, WindowMsgEnum.LoginLoadingWindow.ADD_CALLBACK_IN, callback)
    return
  end
  OpenWindow(WinResConfig.LoginLoadingWindow.name, UILayer.Loading, callback, dontShowEffect)
end

function UIUtil.ChangeLoginScreenEffectOut(callback)
  if UIMgr:IsWindowOpen(WinResConfig.LoginLoadingWindow.name) == false then
    return
  end
  UIMgr:SendWindowMessage(WinResConfig.LoginLoadingWindow.name, WindowMsgEnum.LoginLoadingWindow.PLAY_ANIM_OUT, callback)
end

function UIUtil.ChangeBattleScreenEffectIn(callback)
  if UIMgr:IsWindowOpen(WinResConfig.BattleLoadingWindow.name) and callback then
    UIMgr:SendWindowMessage(WinResConfig.BattleLoadingWindow.name, WindowMsgEnum.BattleLoadingWindow.ADD_CALLBACK_IN, callback)
    return
  end
  OpenWindow(WinResConfig.BattleLoadingWindow.name, UILayer.Loading, callback)
end

function UIUtil.ChangeBattleScreenEffectOut(callback)
  if UIMgr:IsWindowOpen(WinResConfig.BattleLoadingWindow.name) == false then
    callback()
    return
  end
  UIMgr:SendWindowMessage(WinResConfig.BattleLoadingWindow.name, WindowMsgEnum.BattleLoadingWindow.PLAY_ANIM_OUT, callback)
end

function UIUtil.ShowTalkWord(fashionId, bubbleType, wordParam, playVoice, voiceParam, level)
  local curTypingEffect, curSoundEventIns
  local fashionConfig = TableData.GetConfig(fashionId, "BaseFashion")
  if fashionConfig then
    local bubbleId = fashionConfig.bubble_id
    local fashionBubbleConfig = TableData.GetConfig(bubbleId, "BaseFashionBubble")
    if fashionBubbleConfig then
      local ids = fashionBubbleConfig[bubbleType]
      if ids and #ids > 0 then
        local randomId
        if level and (bubbleType == BUBBLE_TYPE_ENUM.GRADE or bubbleType == BUBBLE_TYPE_ENUM.QUALITY) then
          randomId = ids[level]
        else
          randomId = ActorData.GetRandomBubbleSoundId(fashionId, bubbleType, ids)
        end
        local config = TableData.GetConfig(randomId, "BaseCardSound")
        if config then
          if wordParam and config.des then
            local wordTxt = wordParam.wordTxt
            wordTxt.parent.visible = true
            if wordParam.inAnim then
              PlayUITrans(wordTxt.parent, wordParam.inAnim)
            end
            wordTxt.text = config.des()
            local outFunc = function()
              if wordParam.outDelay and IsNil(wordTxt) == false then
                LeanTween.delayedCall(wordTxt, wordParam.outDelay, function()
                  if wordTxt then
                    if wordParam.outAnim then
                      PlayUITrans(wordTxt.parent, wordParam.outAnim, function()
                        if wordTxt then
                          wordTxt.parent.visible = false
                        end
                      end)
                    else
                      wordTxt.parent.visible = false
                    end
                  end
                end)
              end
            end
            if wordParam.interval then
              curTypingEffect = FairyGUI.TypingEffect(wordTxt)
              curTypingEffect:Start()
              curTypingEffect:PrintAll(wordParam.interval)
              
              function curTypingEffect.effectEndAction()
                outFunc()
              end
            else
              outFunc()
            end
          end
          if playVoice and config.path and config.bank then
            local path = Language.ReplaceLanguageVoicePath(config.path)
            local bank = Language.ReplaceLanguageVoicePath(config.bank)
            curSoundEventIns = SoundUtil.PlayVoice(path, bank, voiceParam and voiceParam.gameObject)
          end
        end
      end
    end
  end
  return curTypingEffect, curSoundEventIns
end

return UIUtil
