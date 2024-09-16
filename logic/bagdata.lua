BagData = {selectType = nil}

function BagData.GetSelectType()
  if BagData.selectType == nil then
    BagData.selectType = BAG_TYPE.ALL
  end
  return BagData.selectType
end

function BagData.SetSelectType(selectType)
  if selectType then
    BagData.selectType = selectType
  end
end

function BagData.GetItemByType(bagType)
  if bagType == BAG_TYPE.BADGE then
    return BagData.SortBadge()
  end
  local itemList = {}
  local allItem = ActorData.GetItems()
  local id, itemConfig, itemCopy
  for _, v in ipairs(allItem) do
    id = v.itemId
    itemConfig = TableData.GetConfig(id, "BaseItem")
    if itemConfig.bagType and v.count > 0 then
      if bagType == BAG_TYPE.ALL then
        itemCopy = SimpleCopy(v)
        itemCopy.sort = itemConfig.sort or 0
        table.insert(itemList, itemCopy)
      elseif bagType == itemConfig.bagType then
        itemCopy = SimpleCopy(v)
        itemCopy.sort = itemConfig.sort or 0
        table.insert(itemList, itemCopy)
      end
    end
  end
  if #itemList > 0 then
    table.sort(itemList, function(a, b)
      if a.sort == b.sort and a.expireStamp and b.expireStamp then
        return a.expireStamp < b.expireStamp
      end
      return a.sort > b.sort
    end)
  end
  return itemList
end

function BagData.GetCardSort()
  local cardSort = {}
  local cardData = CardData.GetSortCardList()
  for i = 1, #cardData do
    cardSort[cardData[i].cardId] = i
  end
  return cardSort
end

local BadgeSort = function(a, b, aConfig, bConfig, cardSort)
  if a.wearCardId == b.wearCardId then
    if a.level == b.level then
      if aConfig.type == bConfig.type then
        if a.badgeId == b.badgeId then
          return false
        else
          return a.badgeId < b.badgeId
        end
      else
        return aConfig.type < bConfig.type
      end
    else
      return a.level > b.level
    end
  else
    return cardSort[a.wearCardId] < cardSort[b.wearCardId]
  end
end

function BagData.SortBadge()
  local allBadge = ActorData.GetAllBadge()
  local cardSort = BagData.GetCardSort()
  local aConfig, bConfig, aWear, bWear
  table.sort(allBadge, function(a, b)
    aConfig = TableData.GetConfig(a.badgeId, "BaseBadge")
    bConfig = TableData.GetConfig(b.badgeId, "BaseBadge")
    if bConfig and aConfig then
      if aConfig.star == bConfig.star then
        aWear = 0 ~= a.wearCardId
        bWear = 0 ~= b.wearCardId
        if aWear and bWear then
          return BadgeSort(a, b, aConfig, bConfig, cardSort)
        elseif aWear and not bWear then
          return true
        elseif not aWear and bWear then
          return false
        else
          return BadgeSort(a, b, aConfig, bConfig, cardSort)
        end
      else
        return aConfig.star > bConfig.star
      end
    end
    return false
  end)
  return allBadge
end
