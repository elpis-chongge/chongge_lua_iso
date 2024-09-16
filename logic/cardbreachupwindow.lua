CardBreachUpWindow = {}
local uis, uisBack, breachItemData, breachItemNum, breachTipType, isPlay, shadowFashion

function CardBreachUpWindow.Open(_uis, _uisBack)
  uis = _uis
  uisBack = _uisBack
  isPlay = nil
  PlayUITrans(uis.root, "in")
  PlayUITrans(uisBack.root, "in")
  CardBreachUpWindow.UpdateTextDisplay()
  CardBreachUpWindow.InitBreachUpList()
  CardBreachUpWindow.BreachInit()
  CardBreachUpWindow.InitUpTips()
  CardBreachUpWindow.InitBtn()
  UIUtil.InitAssetsTips(uis.AssetsTipsList, {
    COMMON_ITEM_ID.GAME_COIN
  })
end

function CardBreachUpWindow.UpdateTextDisplay()
  UIUtil.SetBtnText(uis.BreachUp2.BreachUpBtn, T(41), T(43))
end

function CardBreachUpWindow.ShowBreachLv()
  uis.BreachUp1.CardBreach1.c1Ctr.selectedIndex = CardMgr.cardInfoData.quality
  local selectedIndex = CardMgr.cardInfoData.quality + 1 <= CardMgr.cardConfigData.quality_max and CardMgr.cardInfoData.quality + 1 or CardMgr.cardConfigData.quality_max
  uis.BreachUp1.CardBreach2.c1Ctr.selectedIndex = selectedIndex
end

function CardBreachUpWindow.BreachInit()
  CardBreachUpWindow.ShowBreachLv()
  if CardMgr.cardInfoData.level == CardMgr.cardQualityUpData.card_level_max then
    if CardMgr.cardQualityUpData.cost and breachItemNum == #CardMgr.cardQualityUpData.cost then
      breachTipType = 0
    else
      breachTipType = 1
    end
  else
    breachTipType = 2
  end
  if CardMgr.StarIsMax() then
    uis.BreachUp2.BreachUpBtn.visible = false
  else
    uis.BreachUp2.BreachUpBtn.visible = true
  end
end

function CardBreachUpWindow.InitUpTips()
  local qualityUpId = CardMgr.cardConfigData.id * 1000 + CardMgr.cardInfoData.quality + 1
  local qualityData = TableData.GetConfig(qualityUpId, "BaseCardQualityUp")
  if qualityData then
    local unlockFashionId = qualityData.unlock_fashion_id
    if unlockFashionId and unlockFashionId > 0 then
      uisBack.CardShow.root.visible = true
      if shadowFashion ~= unlockFashionId then
        UIUtil.SetCardShowToLoader(uisBack.CardShow.CardShowLoader, unlockFashionId)
        shadowFashion = unlockFashionId
      end
    else
      uisBack.CardShow.root.visible = false
    end
    local list = uis.BreachUp1.BreachSkillList
    if list.numItems > 0 then
      for i = 1, list.numItems do
        list:RemoveChildAt(0, true)
      end
    end
    local addValue = {}
    for i = 1, #qualityData.add_attr do
      local arr = Split(qualityData.add_attr[i], ":")
      addValue[tonumber(arr[2])] = arr[3]
    end
    local widthItem = UIMgr:CreateComponent("Card", "BreachSkill1")
    UIUtil.SetText(widthItem, T(1143, addValue[CardAttribute.GetIdByName(ATTR_ENUM.atk)], addValue[CardAttribute.GetIdByName(ATTR_ENUM.def)], addValue[CardAttribute.GetIdByName(ATTR_ENUM.max_hp)]), "NameTxt")
    local item
    if qualityData.card_level_max_show then
      item = UIMgr:CreateComponent("Card", "BreachSkill")
      UIUtil.SetText(item, T(607), "NameTxt")
      UIUtil.SetText(item, qualityData.card_level_max_show, "NumberTxt")
      item.width = widthItem.width
      list:AddChild(item)
    end
    if unlockFashionId and unlockFashionId > 0 then
      item = UIMgr:CreateComponent("Card", "BreachSkill2")
      UIUtil.SetText(item, T(847), "NameTxt")
      item.width = widthItem.width
      list:AddChild(item)
    end
    if 0 == CardMgr.cardInfoData.quality then
      item = UIMgr:CreateComponent("Card", "BreachSkill3")
      UIUtil.SetText(item, T(1318), "NameTxt")
      UIUtil.SetText(item, T(1309), "NumberTxt")
      item.width = widthItem.width
      list:AddChild(item)
    end
    list:AddChild(widthItem)
    if list.numChildren > 0 then
      item = list:GetChildAt(list.numChildren - 1)
      if item then
        local lineImage = item:GetChild("LineImage")
        if lineImage then
          lineImage.visible = false
        end
      end
    end
  end
end

function CardBreachUpWindow.InitBreachUpList()
  breachItemNum = 0
  breachItemData = GetConfigItemList(CardMgr.cardQualityUpData.cost, true)
  local list = uis.BreachUp2.ItemList
  
  function list.itemRenderer(i, item)
    if breachItemData[i + 1] then
      CardBreachUpWindow.BreachItem(breachItemData[i + 1], item, i * 0.07)
    end
  end
  
  list.numItems = #breachItemData
end

function CardBreachUpWindow.BreachItem(data, item, delayTime)
  local count = ActorData.GetItemCount(data.id)
  local BreachItemBtn = item:GetChild("BreachItemBtn")
  BreachItemBtn.alpha = 0
  if not isPlay then
    PlayUITrans(item, "in", function()
      isPlay = true
    end, delayTime)
  else
    BreachItemBtn.alpha = 1
  end
  if count >= data.value then
    breachItemNum = breachItemNum + 1
    ChangeUIController(BreachItemBtn, "c1", 0)
  else
    ChangeUIController(BreachItemBtn, "c1", 1)
  end
  if data.id == COMMON_ITEM_ID.GAME_COIN then
    if count >= data.value then
      UIUtil.SetText(BreachItemBtn, T(828, data.value), "NumberTxt")
    else
      UIUtil.SetText(BreachItemBtn, T(622, data.value), "NumberTxt")
    end
  elseif count >= data.value then
    local num = count > 999 and T(948) or count
    UIUtil.SetText(BreachItemBtn, T(609, num, data.value), "NumberTxt")
  else
    UIUtil.SetText(BreachItemBtn, T(827, count, data.value), "NumberTxt")
  end
  local breachData = TableData.GetConfig(data.id, "BaseItem")
  if breachData then
    BreachItemBtn:GetChild("PicLoader").url = UIUtil.GetResUrl(breachData.icon)
  end
  item.onClick:Set(function()
    local needCount = data.value - count
    if needCount <= 0 then
      needCount = nil
    end
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_CLICK)
    OpenWindow(WinResConfig.ItemGetTipsWindow.name, nil, {
      id = data.id,
      needCount = needCount,
      fromCardId = CardMgr.cardId
    })
  end)
end

function CardBreachUpWindow.InitBtn()
  uis.BreachUp2.BreachUpBtn.onClick:Set(function()
    if 0 == breachTipType then
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_BREACH_ON_CLICK)
      CardService.QualityUpCardReq(CardMgr.cardId)
    elseif 1 == breachTipType then
      FloatTipsUtil.ShowWarnTips(T(77))
    elseif 2 == breachTipType then
      FloatTipsUtil.ShowWarnTips(T(72, CardMgr.cardQualityUpData.card_level_max_show))
    end
  end)
  uis.BreachUp1.BreachLookBtn.onClick:Set(function()
    OpenWindow(WinResConfig.BreachTipsWindow.name, nil, CardMgr.cardInfoData.cardId)
  end)
end

function CardBreachUpWindow.GetOffsetPosX()
  local w = (GRoot.inst.root.width - uis.root.width) / 2
  local pos = math.abs(uis.BreachUp2.BreachUpBtn:LocalToRoot(Vector2.zero, GRoot.inst.root).x - 1099 - w) / 1000
  return -0.1271 + pos
end

function CardBreachUpWindow.HandleMessage(msgId, para)
end

function CardBreachUpWindow.QuitHide()
  CardBreachUpWindow.CloseBackShadow()
end

function CardBreachUpWindow.CloseBackShadow()
  if uisBack then
    RTManager:ReleaseModelFromLoader(uisBack.CardShow.CardShowLoader)
  end
  shadowFashion = nil
end

function CardBreachUpWindow.OnClose()
  CardBreachUpWindow.QuitHide()
  uis = nil
  uisBack = nil
  breachItemData = nil
  breachItemNum = nil
  breachTipType = nil
  isPlay = nil
end

return CardLevelUpWindow
