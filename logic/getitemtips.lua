local GetItemTips = {}

function GetItemTips.Show(reward, notSort, closeCallback)
  local cardTb = {}
  local itemTb = {}
  local fashionId = {}
  local type
  for _, v in pairs(reward) do
    type = v.item and v.item.tupleType or v.tupleType
    if type == ProtoEnum.TUPLE_TYPE.ITEM or type == ProtoEnum.TUPLE_TYPE.BADGE or type == ProtoEnum.TUPLE_TYPE.BGM then
      local itemId = (v.item or v).itemId
      local guild_exp = false
      if itemId then
        local conf = TableData.GetConfig(itemId, "BaseItem")
        if conf and 10 == conf.type then
          guild_exp = true
        end
      end
      if not guild_exp then
        if v.item then
          if #v.changeItem > 0 then
            for i = 1, #v.changeItem do
              table.insert(itemTb, v.changeItem[i])
            end
          else
            table.insert(itemTb, v.item)
          end
        else
          table.insert(itemTb, v)
        end
      end
    elseif type == ProtoEnum.TUPLE_TYPE.CARD then
      if v.item then
        table.insert(cardTb, v)
      else
        table.insert(cardTb, {item = v})
      end
    elseif type == ProtoEnum.TUPLE_TYPE.T_FASHION then
      local fId = v.item and v.item.itemId or v.itemId
      table.insert(fashionId, {
        id = fId,
        new = v.isNew,
        effect = true
      })
    end
  end
  local showItem = #itemTb > 0
  local showCard = #cardTb > 0
  local showFashion = #fashionId > 0
  if showItem and not showCard and not showFashion then
    OpenWindow(WinResConfig.GetItemTipsWindow.name, nil, itemTb, notSort, closeCallback)
  elseif showCard and not showItem and not showFashion then
    OpenWindow(WinResConfig.LotteryPaintingShowWindow.name, nil, cardTb, closeCallback)
  elseif showFashion and not showItem and not showCard then
    OpenWindow(WinResConfig.ClothesGetShowWindow.name, nil, fashionId, closeCallback, true)
  elseif showFashion and showCard and showItem then
    OpenWindow(WinResConfig.ClothesGetShowWindow.name, nil, fashionId, function()
      OpenWindow(WinResConfig.LotteryPaintingShowWindow.name, nil, cardTb, function()
        local newItems = GetItemTips.GetCardChangeItem(cardTb, itemTb)
        OpenWindow(WinResConfig.GetItemTipsWindow.name, nil, newItems, notSort, closeCallback)
      end, true, true)
    end, true)
  elseif showCard and showItem then
    OpenWindow(WinResConfig.LotteryPaintingShowWindow.name, nil, cardTb, function()
      local newItems = GetItemTips.GetCardChangeItem(cardTb, itemTb)
      OpenWindow(WinResConfig.GetItemTipsWindow.name, nil, newItems, notSort, closeCallback)
    end, true, true)
  elseif showFashion and showItem then
    OpenWindow(WinResConfig.ClothesGetShowWindow.name, nil, fashionId, function()
      OpenWindow(WinResConfig.GetItemTipsWindow.name, nil, itemTb, notSort, closeCallback)
    end, true)
  elseif showFashion and showCard then
    OpenWindow(WinResConfig.ClothesGetShowWindow.name, nil, fashionId, function()
      OpenWindow(WinResConfig.LotteryPaintingShowWindow.name, nil, cardTb, closeCallback)
    end, true)
  end
end

function GetItemTips.GetCardChangeItem(rewardData, dropItem)
  local tb = {}
  local AddItem = function(item)
    local isFind = false
    for i, v in ipairs(tb) do
      if v.itemId == item.itemId and item.tupleType == ProtoEnum.TUPLE_TYPE.ITEM then
        isFind = true
        tb[i].count = tb[i].count + item.count
        break
      end
    end
    if false == isFind then
      table.insert(tb, item)
    end
  end
  if rewardData then
    for _, v in pairs(rewardData) do
      if v.changeItem then
        for k, vv in pairs(v.changeItem) do
          AddItem(vv)
        end
      end
    end
  end
  if dropItem then
    for i, v in pairs(dropItem) do
      AddItem(v)
    end
  end
  return tb
end

return GetItemTips
