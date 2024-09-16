ShopData = {
  shopInfo = {},
  productInfo = {},
  giftInfo = {},
  limitRecord = {},
  curShopType = nil,
  RecommendInfo = {},
  monthCardDay = {},
  agreementInfo = nil
}

function ShopData.ClearData()
  ShopData.shopInfo = {}
  ShopData.productInfo = {}
  ShopData.limitRecord = {}
  ShopData.giftInfo = {}
  ShopData.curShopType = nil
  ShopData.agreementInfo = nil
  ShopData.RecommendInfo = {}
  ShopData.monthCardDay = {}
end

local readUid = {}

function ShopData.InitNew()
  local str = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.SHOP_RECOMMEND_NEW)
  if "" ~= str then
    readUid = Json.decode(str)
  end
end

function ShopData.SaveNew(uid, allUid)
  if allUid then
    for i = #readUid, 1, -1 do
      if not allUid[readUid[i]] then
        table.remove(readUid, i)
      end
    end
  end
  table.insert(readUid, uid)
  local str = Json.encode(readUid)
  PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.SHOP_RECOMMEND_NEW, str)
end

function ShopData.NewIsShow(uid)
  return not table.contain(readUid, uid)
end

function ShopData.SaveProductInfo(allInfo)
  for i, v in pairs(allInfo) do
    ShopData.UpdateOneProductInfo(v)
  end
  ShopData.CheckAllProductInfoTime()
end

function ShopData.CheckAllProductInfoTime()
  local curTime = LoginData.GetCurServerTime()
  for type, data in pairs(ShopData.productInfo) do
    for i = #data, 1, -1 do
      if -1 ~= data[i].endStamp and curTime > data[i].endStamp then
        table.remove(ShopData.productInfo[type], i)
      end
    end
  end
end

function ShopData.UpdateOneProductInfo(productInfo)
  if ShopData.productInfo[productInfo.productType] == nil then
    ShopData.productInfo[productInfo.productType] = {}
  end
  local isFind = false
  for i, v in ipairs(ShopData.productInfo[productInfo.productType]) do
    if v.id == productInfo.id then
      ShopData.productInfo[productInfo.productType][i] = productInfo
      return
    end
  end
  if false == isFind then
    table.insert(ShopData.productInfo[productInfo.productType], productInfo)
  end
end

function ShopData.GetShopGoodsInfoById(id)
  for i = 1, 4 do
    if ShopData.shopInfo[i] then
      for ii, v in pairs(ShopData.shopInfo[i].goods) do
        if v.goodsId == id then
          return v
        end
      end
    end
  end
end

function ShopData.GetProductInfoById(id)
  for type, data in pairs(ShopData.productInfo) do
    for i, v in pairs(data) do
      if v.id == id then
        return v
      end
    end
  end
end

function ShopData.SaveShopInfo(msg)
  for i, v in pairs(msg) do
    ShopData.shopInfo[v.typeId] = v
  end
end

function ShopData.SaveGiftInfo(giftItems)
  for i, v in pairs(giftItems) do
    ShopData.UpdateOneGift(v)
  end
end

function ShopData.GetGiftInfoById(giftId)
  for i, v in pairs(ShopData.giftInfo) do
    if v.giftId == giftId then
      return v
    end
  end
end

function ShopData.UpdateOneGift(giftInfo)
  local isFind = false
  for i, v in ipairs(ShopData.giftInfo) do
    if v.giftId == giftInfo.giftId then
      ShopData.giftInfo[i] = giftInfo
      return
    end
  end
  if false == isFind then
    table.insert(ShopData.giftInfo, giftInfo)
  end
end
