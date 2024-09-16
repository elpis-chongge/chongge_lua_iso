ShopMgr = {}
USE_TYPE = {
  NONE = 0,
  BADGE = 1,
  SKILL_UP = 2,
  QUALITY_UP = 3,
  CARD = 4
}

function ShopMgr.TokenIsBuy(id)
  local data = ShopData.GetShopGoodsInfoById(id)
  if nil == data then
    FloatTipsUtil.ShowWarnTips(T(556))
    return
  end
  local serviceData = ShopData.GetShopGoodsInfoById(id)
  local shopGridData = TableData.GetConfig(serviceData.gridId, "BaseShopGrid")
  local num = shopGridData.sell_limit_time - serviceData.boughtNum
  if -1 == shopGridData.sell_limit_time or num > 0 then
    return true
  else
    FloatTipsUtil.ShowWarnTips(T(557))
  end
end

function ShopMgr.ProductIsBuy(id, type)
  local data = ShopData.GetProductInfoById(id)
  if nil == data then
    FloatTipsUtil.ShowWarnTips(T(556))
    return
  end
  if type == ProtoEnum.PRODUCT_TYPE.PT_FASHION then
    if data.owned == false then
      return true
    else
      FloatTipsUtil.ShowWarnTips(T(557))
    end
  elseif type == ProtoEnum.PRODUCT_TYPE.PT_GIFT then
    local configGiftData = TableData.GetConfig(id, "BasePayProduct")
    if nil == ShopData.limitRecord[id] or ShopData.limitRecord[id] < configGiftData[id].sell_limit_max then
      return true
    else
      FloatTipsUtil.ShowWarnTips(T(557))
    end
  end
end

function ShopMgr.BuyProduct(payProductId, rspCallBack)
  if SDKManager.UseSDK then
    ShopService.CreatePayOrderReq(payProductId)
  else
    ShopService.PurchaseBuyReq(payProductId, rspCallBack)
  end
end

function ShopMgr.CheckMonthCardDay(notOpen)
  for i, v in pairs(ShopData.monthCardDay) do
    if v > 0 and ShopData.monthCardReward[i] == nil or ShopData.monthCardReward[i] == false then
      if nil == notOpen then
        OpenWindow(WinResConfig.MonthGetWindow.name)
      end
      return true
    end
  end
  return false
end

local IsContain = function(tb, id)
  local arr = GetConfigItemList(tb)
  for i, v in pairs(arr) do
    if v.id == id then
      local count = ActorData.GetItemCount(v.id)
      if count < v.value then
        return true, v.value
      end
    end
  end
end

function ShopMgr.CanCardSkillUp(cardInfo, id)
  local cardData = TableData.GetConfig(cardInfo.cardId, "BaseCard")
  local skill = {}
  if cardData then
    for i, v in ipairs(cardData.unlock_skill_ids) do
      if cardInfo.skill2Level[v] then
        local skId = v * 1000 + cardInfo.skill2Level[v]
        local skillLevelUpData = TableData.GetConfig(skId, "BaseSkillLevelUp")
        if skillLevelUpData and skillLevelUpData.cost then
          local bol, num = IsContain(skillLevelUpData.cost, id)
          if bol then
            table.insert(skill, {
              id = v,
              num = num,
              lv = cardInfo.skill2Level[v]
            })
          end
        end
      end
    end
  end
  local quality, qualityNum = ShopMgr.CanCardQualityUp(cardInfo, id)
  return #skill > 0 or quality, skill, quality, qualityNum
end

function ShopMgr.CanCardQualityUp(cardInfo, id)
  local qualityUpId = cardInfo.cardId * 1000 + cardInfo.quality
  local cardQualityUpData = TableData.GetConfig(qualityUpId, "BaseCardQualityUp")
  if cardQualityUpData and cardQualityUpData.cost then
    local bol, num = IsContain(cardQualityUpData.cost, id)
    if bol then
      return true, num
    end
  end
end

function ShopMgr.GetLookDetailsBtn(id, cardSort)
  local cardList = ActorData.GetCardList()
  local newCard = {}
  for i, v in pairs(cardList) do
    local bol, skillId, quality, qualityNum = ShopMgr.CanCardSkillUp(v, id)
    if bol then
      if #skillId > 0 then
        table.insert(newCard, {
          data = v,
          skill = skillId,
          quality = quality,
          qualityNum = qualityNum
        })
      else
        table.insert(newCard, {
          data = v,
          quality = quality,
          qualityNum = qualityNum
        })
      end
    end
  end
  if cardSort and #newCard > 1 then
    table.sort(newCard, function(a, b)
      return CardData.DefaultSort(a.data, b.data)
    end)
  end
  return USE_TYPE.CARD, newCard
end

function ShopMgr.LoadSpineByLoader(loader, holder, configData, canBuy)
  if loader then
    if not string.isEmptyOrNil(configData.spd) and holder then
      local path = "Assets/Art/Models/UI_spine/prefab/" .. configData.spd
      local curHolder = holder
      loader.url = ""
      local go = UIUtil.SetEffectToUI(path, curHolder)
      if canBuy then
        SkeletonAnimationUtil.SetAnimation(go, 0, "begin", false, 0, function()
          ShopMgr.PlayIdleAnimation(go)
        end)
      else
        SkeletonAnimationUtil.SetAnimation(go, 0, "idle2", true)
      end
      curHolder.visible = true
    elseif configData.icon then
      if holder then
        holder.visible = false
      end
      loader.url = UIUtil.GetResUrl(configData.icon)
    end
  end
end

function ShopMgr.PlayIdleAnimation(go)
  SkeletonAnimationUtil.SetAnimation(go, 0, "idle1", false, math.random(2, 3) * 2, function()
    SkeletonAnimationUtil.SetAnimation(go, 0, "show", false, 0, function()
      ShopMgr.PlayIdleAnimation(go)
    end)
  end)
end

function ShopMgr.GetMonthCardDay(productData)
  if ShopData.monthCardDay[productData.month_card_type] then
    return ShopData.monthCardDay[productData.month_card_type]
  end
  return 0
end

function ShopMgr.GetPayProductIdByType(type)
  local tb = TableData.GetTable("BasePayProduct")
  for i, v in pairs(tb) do
    if type == v.type then
      return v
    end
  end
end

function ShopMgr.GetOneGiftReward(groupId)
  local data = TableData.GetTable("BaseActivityAgreementReward")
  local newTb = {}
  for i, v in pairs(data) do
    if v.group_id == groupId then
      table.insert(newTb, v)
    end
  end
  table.sort(newTb, function(a, b)
    return a.need_day < b.need_day
  end)
  return newTb
end
