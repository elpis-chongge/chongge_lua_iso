ShopService = {}

function ShopService.Init()
  Net.AddListener(Proto.MsgName.GetShopInfoRsp, ShopService.GetShopInfoRsp)
  Net.AddListener(Proto.MsgName.BuyShopGoodsRsp, ShopService.BuyShopGoodsRsp)
  Net.AddListener(Proto.MsgName.PurchaseBuyRsp, ShopService.PurchaseBuyRsp)
  Net.AddListener(Proto.MsgName.PurchaseGetRsp, ShopService.PurchaseGetRsp)
  Net.AddListener(Proto.MsgName.GetPurchaseProductsRsp, ShopService.GetPurchaseProductsRsp)
  Net.AddListener(Proto.MsgName.FashionBuyRsp, ShopService.FashionBuyRsp)
  Net.AddListener(Proto.MsgName.MonthCardDailyRewardRsp, ShopService.MonthCardDailyRewardRsp)
  Net.AddListener(Proto.MsgName.CreatePayOrderRsp, ShopService.CreatePayOrderRsp)
  Net.AddListener(Proto.MsgName.CancelPayOrderRsp, ShopService.CancelPayOrderRsp)
  Net.AddListener(Proto.MsgName.GetAllRecommendImgRsp, ShopService.GetAllRecommendImgRsp)
  Net.AddListener(Proto.MsgName.GetGiftInfoRsp, ShopService.GetGiftInfoRsp)
  Net.AddListener(Proto.MsgName.BuyGiftRsp, ShopService.BuyGiftRsp)
  Net.AddListener(Proto.MsgName.GetGiftRewardRsp, ShopService.GetGiftRewardRsp)
  Net.AddListener(Proto.MsgName.GetAgreementInfoRsp, ShopService.GetAgreementInfoRsp)
  Net.AddListener(Proto.MsgName.RewardAgreementRsp, ShopService.RewardAgreementRsp)
end

function ShopService.GetShopInfoReq(types, rspCallback)
  local msg = {}
  msg.types = types
  Net.Send(Proto.MsgName.GetShopInfoReq, msg, rspCallback)
end

function ShopService.GetShopInfoRsp(msg)
  ShopData.SaveShopInfo(msg.shopList)
end

function ShopService.BuyShopGoodsReq(gridId, num, rspCallback)
  local msg = {}
  msg.num = num
  msg.gridId = gridId
  Net.Send(Proto.MsgName.BuyShopGoodsReq, msg, rspCallback)
end

function ShopService.BuyShopGoodsRsp(msg)
  if #msg.goods > 0 then
    GetItemTips.Show(msg.goods)
    ShopData.SaveShopInfo({
      msg.shop
    })
    UIMgr:SendWindowMessage(WinResConfig.ShopWindow.name, WindowMsgEnum.ShopWindow.REFRESH_NUM)
  end
end

function ShopService.CreatePayOrderReq(productId)
  local msg = {}
  msg.productBaseId = productId
  Net.Send(Proto.MsgName.CreatePayOrderReq, msg)
end

function ShopService.CreatePayOrderRsp(msg)
  if 0 == msg.productBaseId then
    printError("无效订单")
    return
  end
  if SDKManager.UseSDK == true then
    local sdk = SDKManager:GetSDKChannel()
    local config = TableData.GetConfig(msg.productBaseId, "BasePayProduct")
    if "Bilibili" == sdk then
      local strs = Split(msg.nonce, ":")
      SDKManager:PaySDK(LoginMgr.bilibili_uid, LoginMgr.bilibili_username, ActorData.GetName(), config.price * 100, config.diamond, strs[1], config.name(), config.name(), msg.nonce, "", msg.orderSign, config.product_id)
    elseif "PnSDK_CN" == sdk then
      print("发起充值请求：pnsdk ", "product_id", config.product_id, "nonce", msg.nonce)
      SDKManager:PaySDK(config.product_id, LoginData.GetSDKServerId(), ActorData.GetUin(), ActorData.GetLevel(), msg.nonce)
    end
  end
end

function ShopService.PurchaseBuyReq(id, rspCallback)
  local msg = {}
  msg.id = id
  Net.Send(Proto.MsgName.PurchaseBuyReq, msg, rspCallback)
end

function ShopService.PurchaseBuyRsp(msg)
  ShopData.isBought = msg.isBought
  if msg.isBought and not ShopData.GetGiftInfoById(27000100) then
    ShopService.GetGiftInfoReq(function()
      RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.SHOP)
    end)
  end
  ShopData.limitRecord = msg.limitRecord
  ShopData.monthCardDay = msg.monthCardDay
  for i = #msg.reward, 1, -1 do
    if 0 == msg.reward[i].count then
      table.remove(msg.reward, i)
    end
  end
  GetItemTips.Show(msg.reward, true, function()
    if ShopData.monthCardReward then
      for i, v in pairs(ShopData.monthCardDay) do
        if v > 0 and ShopData.monthCardReward[i] == nil or ShopData.monthCardReward[i] == false then
          OpenWindow(WinResConfig.MonthGetWindow.name)
          break
        end
      end
    end
  end)
  UIMgr:SendWindowMessage(WinResConfig.ShopGiftTipsWindow.name, WindowMsgEnum.ShopWindow.REFRESH_PRODUCT)
  UIMgr:SendWindowMessage(WinResConfig.ShopWindow.name, WindowMsgEnum.ShopWindow.REFRESH_PRODUCT)
  UIMgr:SendWindowMessage(WinResConfig.ShopWindow.name, WindowMsgEnum.ShopWindow.REFRESH_ONE_GIFT)
  UIMgr:SendWindowMessage(WinResConfig.PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.ActivityPassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.Activity2PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
  UIMgr:SendWindowMessage(WinResConfig.Activity3PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
end

function ShopService.CancelPayOrderReq(nonce)
  if string.isEmptyOrNil(nonce) == false then
    local msg = {}
    msg.nonce = nonce
    Net.Send(Proto.MsgName.CancelPayOrderReq, msg)
  end
end

function ShopService.CancelPayOrderRsp(msg)
end

function ShopService.PurchaseGetReq(rspCallback, errorCallback)
  Net.Send(Proto.MsgName.PurchaseGetReq, {}, rspCallback, errorCallback)
end

function ShopService.PurchaseGetRsp(msg)
  ShopData.limitRecord = msg.limitRecord or {}
  ShopData.monthCardDay = msg.monthCardDay or {}
  ShopData.monthCardReward = msg.monthCardReward or {}
  ShopData.isBought = msg.isBought
end

function ShopService.GetPurchaseProductsReq(type, platform, rspCallback, errorCallback)
  local msg = {}
  msg.productTypes = type
  msg.platformType = platform
  Net.Send(Proto.MsgName.GetPurchaseProductsReq, msg, rspCallback, errorCallback)
end

function ShopService.GetPurchaseProductsRsp(msg)
  ShopData.SaveProductInfo(msg.list)
end

function ShopService.FashionBuyReq(id, rspCallback)
  local msg = {}
  msg.buyFashionId = id
  Net.Send(Proto.MsgName.FashionBuyReq, msg, rspCallback)
end

function ShopService.FashionBuyRsp(msg)
  if ShopData.productInfo[ProtoEnum.PRODUCT_TYPE.PT_FASHION] then
    for i, v in pairs(ShopData.productInfo[ProtoEnum.PRODUCT_TYPE.PT_FASHION]) do
      if v.id and v.id == msg.buyFashionId then
        ShopData.productInfo[ProtoEnum.PRODUCT_TYPE.PT_FASHION][i].owned = true
        break
      end
    end
  end
  UIMgr:SendWindowMessage(WinResConfig.ShopWindow.name, WindowMsgEnum.ShopWindow.GET_CLOTHES)
end

function ShopService.GetAllRecommendImgReq(rspCallback)
  local msg = {}
  msg.onlyOnShelf = true
  Net.Send(Proto.MsgName.GetAllRecommendImgReq, msg, rspCallback)
end

function ShopService.GetAllRecommendImgRsp(msg)
  ShopData.RecommendInfo = msg.infos
  UIMgr:SendWindowMessage(WinResConfig.ShopWindow.name, WindowMsgEnum.ShopWindow.GET_RECOMMEND)
end

function ShopService.MonthCardDailyRewardReq(id)
  local msg = {}
  msg.cardType = id
  Net.Send(Proto.MsgName.MonthCardDailyRewardReq, msg)
end

function ShopService.MonthCardDailyRewardRsp(msg)
  ShopData.monthCardReward = msg.monthCardReward or {}
  UIMgr:SendWindowMessage(WinResConfig.MonthGetWindow.name, WindowMsgEnum.ShopWindow.GET_MONTH, msg.reward)
  UIMgr:SendWindowMessage(WinResConfig.ShopWindow.name, WindowMsgEnum.ShopWindow.GET_MONTH)
end

function ShopService.GetGiftInfoReq(rspCallback)
  local msg = {}
  Net.Send(Proto.MsgName.GetGiftInfoReq, msg, rspCallback)
end

function ShopService.GetGiftInfoRsp(msg)
  ShopData.SaveGiftInfo(msg.gifts)
  ShopData.canRewards = msg.canRewards
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.SHOP)
end

function ShopService.BuyGiftReq(giftId, rspCallback)
  local msg = {}
  msg.giftId = giftId
  Net.Send(Proto.MsgName.BuyGiftReq, msg, rspCallback)
end

function ShopService.BuyGiftRsp(msg)
  ShopData.SaveGiftInfo(msg.gifts)
  ShopData.canRewards = msg.canRewards
  if #msg.goods > 0 then
    GetItemTips.Show(msg.goods, true)
  end
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.SHOP)
end

function ShopService.GetGiftRewardReq(giftId, stepId, rspCallback)
  local msg = {}
  msg.gitfId = giftId
  msg.stepId = stepId
  Net.Send(Proto.MsgName.GetGiftRewardReq, msg, rspCallback)
end

function ShopService.GetGiftRewardRsp(msg)
  ShopData.SaveGiftInfo(msg.gifts)
  ShopData.canRewards = msg.canRewards
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.SHOP)
end

function ShopService.GetAgreementInfoReq(rspCallback)
  local msg = {}
  Net.Send(Proto.MsgName.GetAgreementInfoReq, msg, rspCallback)
end

function ShopService.GetAgreementInfoRsp(msg)
  ShopData.agreementInfo = msg
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.SHOP)
end

function ShopService.RewardAgreementReq(rewardId, rspCallback)
  local msg = {}
  msg.rewardId = rewardId
  Net.Send(Proto.MsgName.RewardAgreementReq, msg, rspCallback)
end

function ShopService.RewardAgreementRsp(msg)
  ShopData.agreementInfo.rewards = msg.rewards
  local newReward = {}
  local AddItem = function(drop)
    local isFind = false
    for i, v in ipairs(newReward) do
      if v.item.itemId == drop.item.itemId and v.item.tupleType == ProtoEnum.TUPLE_TYPE.ITEM then
        isFind = true
        newReward[i].item.count = newReward[i].item.count + drop.item.count
        break
      end
    end
    if false == isFind then
      table.insert(newReward, drop)
    end
  end
  for i = 1, #msg.reward do
    AddItem(msg.reward[i])
  end
  GetItemTips.Show(newReward)
end

ShopService.Init()
