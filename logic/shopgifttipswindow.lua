require("Message_GiftTipsWindowByName")
local ShopGiftTipsWindow = {}
local uis, contentPane, productData, giftData, productInfo

function ShopGiftTipsWindow.ReInitData()
end

function ShopGiftTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ShopGiftTipsWindow.package, WinResConfig.ShopGiftTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetMessage_GiftTipsWindowUis(contentPane)
    local tipsData = bridgeObj.argTable[2]
    if tipsData and #tipsData >= 1 then
      UIUtil.InitAssetsTips(uis.Main.AssetsTipsGroup.AssetsTipsList, tipsData, true)
    end
    local id = bridgeObj.argTable[1]
    productInfo = ShopData.GetProductInfoById(id)
    productData = TableData.GetConfig(id, "BasePayProduct")
    giftData = TableData.GetConfig(id, "BaseGift")
    ShopGiftTipsWindow.UpdateInfo()
    ShopGiftTipsWindow.InitBtn()
  end)
end

function ShopGiftTipsWindow.CheckItemTime()
  if productInfo and productInfo.endStamp > 0 then
    uis.Main.root.onClick:Set(function()
      if productInfo.endStamp < LoginData.GetCurServerTime() then
        local name = productData and productData.name()
        if name then
          FloatTipsUtil.ShowWarnTips(T(1064, name))
        else
          FloatTipsUtil.ShowWarnTips(T(556))
        end
        UIMgr:CloseWindow(WinResConfig.ShopGiftTipsWindow.name)
      end
    end)
  end
end

function ShopGiftTipsWindow.UpdateInfo()
  uis.Main.GiftTips1.GiftRewardList.WordTxt.text = T(1102)
  if productData then
    ShopGiftTipsWindow.CheckItemTime()
    local gift1 = uis.Main.GiftTips1
    local gift2 = uis.Main.GiftTips2
    gift2.Bg.PicLoader.url = UIUtil.GetResUrl(productData.icon)
    gift2.GiftMonthTime.WordTxt.text = T(1036)
    if productInfo then
      local time = productInfo.endStamp - LoginData.GetCurServerTime()
      if time > 0 then
        ChangeController(gift2.c1Ctr, 1)
        gift2.GiftMonthTime.TimeTxt.text = TimeUtil.FormatEnTime(time)
      else
        ChangeController(gift2.c1Ctr, 0)
      end
    end
    gift1.GiftName.NameTxt.text = productData.name()
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_gift_light.prefab", gift2.EffectHolder)
    if productData.sell_limit_max then
      local sellLimitType = {
        551,
        552,
        553,
        554
      }
      if 0 ~= productData.sell_limit_type and sellLimitType[productData.sell_limit_type] then
        local buyNum = ShopData.limitRecord[productData.id] or 0
        gift1.GiftWordContent.GiftLimitationNumber.NumberTxt.text = T(sellLimitType[productData.sell_limit_type], productData.sell_limit_max - buyNum)
      else
        gift1.GiftWordContent.GiftLimitationNumber.NumberTxt.text = ""
      end
    end
    if productData.des then
      function gift1.GiftWordContent.WordList.itemRenderer(i, item)
        UIUtil.SetText(item, T(productData.des[i + 1]), "WordTxt")
      end
      
      gift1.GiftWordContent.WordList.numItems = #productData.des
      ChangeController(gift1.c1Ctr, 0)
    else
      ChangeController(gift1.c1Ctr, 1)
    end
    gift1.GiftRewardList.WordTxt.text = T(1035)
    if 2 == productData.type then
      local list = gift1.GiftRewardList.GiftRewardMonthList.ItemList
      local reward = ShopGiftTipsWindow.GetReward()
      if reward[1] then
        UIUtil.ShowItemFrame(reward[1].id, gift1.GiftRewardList.GiftRewardMonthList.OnceItem.root, reward[1].value, nil, function()
          SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_CLICK)
          OpenWindow(WinResConfig.ItemGetTipsWindow.name, nil, {
            id = reward[1].id
          })
        end)
        gift1.GiftRewardList.GiftRewardMonthList.OnceItem.WordTxt.text = T(1037)
        ChangeController(gift1.GiftRewardList.GiftRewardMonthList.OnceItem.c2Ctr, 1)
      end
      local rewardDay = ShopGiftTipsWindow.GetDayReward()
      
      function list.itemRenderer(i, item)
        UIUtil.SetText(item, T(1038), "WordTxt")
        UIUtil.ShowItemFrame(rewardDay[i + 1].id, item, rewardDay[i + 1].value, nil, function()
          SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_CLICK)
          OpenWindow(WinResConfig.ItemGetTipsWindow.name, nil, {
            id = rewardDay[i + 1].id
          })
        end)
        ChangeUIController(item, "c2", 2)
      end
      
      list.numItems = #rewardDay
      if ShopData.monthCardDay[productData.month_card_type] and ShopData.monthCardDay[productData.month_card_type] > 0 then
        gift2.GiftMonthTime.TimeTxt.text = T(1069, ShopData.monthCardDay[productData.month_card_type])
        ChangeController(gift2.c1Ctr, 1)
      end
      ChangeController(gift1.GiftRewardList.c1Ctr, 1)
    elseif 3 == productData.type then
      local reward = ShopGiftTipsWindow.GetReward()
      local list = gift1.GiftRewardList.ItemList
      
      function list.itemRenderer(i, item)
        UIUtil.ShowItemFrame(reward[i + 1].id, item, reward[i + 1].value, nil, function()
          SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_CLICK)
          OpenWindow(WinResConfig.ItemGetTipsWindow.name, nil, {
            id = reward[i + 1].id
          })
        end)
      end
      
      list.numItems = #reward
      ChangeController(gift1.GiftRewardList.c1Ctr, 0)
    end
    if 2 == productData.type then
      local GetDay = function()
        if ShopData.monthCardDay[productData.month_card_type] then
          return ShopData.monthCardDay[productData.month_card_type]
        end
        return 0
      end
      if productData.sell_limit_max then
        if GetDay() <= productData.sell_limit_max then
          ChangeController(gift1.c3Ctr, 0)
        else
          ChangeController(gift1.c3Ctr, 1)
          gift1.LackWord.WordTxt.text = T(1098)
        end
      end
    elseif productData.sell_level then
      local lv = ActorData.GetLevel()
      if lv >= productData.sell_level[1] and lv <= productData.sell_level[2] then
        ChangeController(gift1.c3Ctr, 0)
      else
        ChangeController(gift1.c3Ctr, 1)
        gift1.LackWord.WordTxt.text = T(1039)
      end
    end
    if productData.price then
      gift1.GiftBuyPrice.GiftBuyPrice1.WordTxt.text = T(1018)
      gift1.GiftBuyPrice.GiftBuyPrice1.NumberTxt.text = T(518, 18, productData.price)
      gift1.GiftBuyPrice.c1Ctr.selectedIndex = 0
    end
    UIUtil.SetBtnText(gift1.SureBtn, T(399), T(400))
    gift1.SureBtn.onClick:Set(ShopGiftTipsWindow.BuyProduct)
    gift1.c2Ctr.selectedIndex = 0
  end
  if giftData then
    local gift1 = uis.Main.GiftTips1
    local gift2 = uis.Main.GiftTips2
    gift2.Bg.PicLoader.url = UIUtil.GetResUrl(giftData.icon)
    gift1.GiftName.NameTxt.text = giftData.name()
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_gift_light.prefab", gift2.EffectHolder)
    local reward = GetConfigItemList(giftData.rewards, true)
    local list = gift1.GiftRewardList.ItemList
    
    function list.itemRenderer(i, item)
      UIUtil.ShowItemFrame(reward[i + 1].id, item, reward[i + 1].value, nil, function()
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_CLICK)
        OpenWindow(WinResConfig.ItemGetTipsWindow.name, nil, {
          id = reward[i + 1].id
        })
      end)
    end
    
    list.numItems = #reward
    ChangeController(gift1.GiftRewardList.c1Ctr, 0)
    local arr = Split(giftData.condition[1], ":")
    if 2 == #arr and tonumber(arr[1]) == CONDITION_ENUM.LV and ActorData.GetLevel() >= tonumber(arr[2]) then
      ChangeController(gift1.c3Ctr, 0)
    else
      ChangeController(gift1.c3Ctr, 1)
      gift1.LackWord.WordTxt.text = T(1039)
    end
    if giftData.sell_limit_max then
      local sellLimitType = {
        551,
        552,
        553,
        554
      }
      gift1.GiftWordContent.GiftLimitationNumber.NumberTxt.text = T(sellLimitType[giftData.sell_limit_type], giftData.sell_limit_max)
      ChangeController(gift1.c1Ctr, 1)
    end
    if giftData.cost then
      local cost = GetConfigItemList(giftData.cost, true)
      if cost[1] then
        UIUtil.SetIconById(gift1.GiftBuyPrice.GiftBuyPrice2.PicLoader, cost[1].id)
        gift1.GiftBuyPrice.GiftBuyPrice2.NumberTxt.text = cost[1].value
        gift1.GiftBuyPrice.GiftBuyPrice2.WordTxt.text = T(1018)
        gift1.c2Ctr.selectedIndex = 1
      end
    else
      gift1.GiftBuyPrice.GiftBuyPrice3.NumberTxt.text = T(1067)
      gift1.c2Ctr.selectedIndex = 2
    end
    UIUtil.SetBtnText(gift1.SureBtn, T(399), T(400))
    gift1.SureBtn.onClick:Set(ShopGiftTipsWindow.BuyGift)
  end
end

function ShopGiftTipsWindow.BuyGift()
  if giftData then
    local rspCallBack = function()
      ShopGiftTipsWindow.CloseWindow()
      UIMgr:SendWindowMessage(WinResConfig.ShopWindow.name, WindowMsgEnum.ShopWindow.REFRESH_GIFT)
    end
    if giftData.cost then
      local cost = GetConfigItemList(giftData.cost, true)
      if cost[1] then
        local gold = ActorData.GetItemCount(cost[1].id)
        if gold >= cost[1].value then
          ShopService.BuyGiftReq(giftData.id, function()
            rspCallBack()
          end)
        else
          local itemConfig = TableData.GetConfig(cost[1].id, "BaseItem")
          if itemConfig then
            FloatTipsUtil.ShowWarnTips(T(366, itemConfig.name()))
          end
        end
      end
    else
      ShopService.BuyGiftReq(giftData.id, function()
        rspCallBack()
      end)
    end
  end
end

function ShopGiftTipsWindow.BuyProduct()
  if productInfo and -1 ~= productInfo.endStamp and productInfo.endStamp < LoginData.GetCurServerTime() then
    FloatTipsUtil.ShowWarnTips(T(556))
    ShopGiftTipsWindow.CloseWindow()
  else
    ShopMgr.BuyProduct(productData.id)
  end
end

function ShopGiftTipsWindow.GetReward()
  local arr1 = GetConfigItemList(productData.rewards, true)
  local bindDiamond = productData.bindDiamond or 0
  local extra_bindDiamond = productData.extra_bindDiamond or 0
  local diamond = bindDiamond + extra_bindDiamond
  if diamond > 0 then
    table.insert(arr1, 1, {
      type = 1,
      id = COMMON_ITEM_ID.BIND_DIAMOND,
      value = diamond
    })
  end
  local tempDiamond = productData.diamond or 0
  local extra_diamond = productData.extra_diamond or 0
  diamond = tempDiamond + productData.extra_diamond
  if diamond > 0 then
    table.insert(arr1, 1, {
      type = 1,
      id = COMMON_ITEM_ID.RECHARGE_DIAMOND,
      value = diamond
    })
  end
  return arr1
end

function ShopGiftTipsWindow.GetDayReward()
  local arr1 = GetConfigItemList(productData.day_rewards, true)
  if productData.day_bindDiamond > 0 then
    table.insert(arr1, 1, {
      type = 1,
      id = COMMON_ITEM_ID.BIND_DIAMOND,
      value = productData.day_bindDiamond
    })
  end
  if productData.day_diamond > 0 then
    table.insert(arr1, 1, {
      type = 1,
      id = COMMON_ITEM_ID.RECHARGE_DIAMOND,
      value = productData.day_diamond
    })
  end
  return arr1
end

function ShopGiftTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(ShopGiftTipsWindow.CloseWindow)
end

function ShopGiftTipsWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.ShopGiftTipsWindow.name)
end

function ShopGiftTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  productInfo = nil
  productData = nil
end

function ShopGiftTipsWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.ShopWindow.REFRESH_PRODUCT then
    ShopGiftTipsWindow.CloseWindow()
  end
end

return ShopGiftTipsWindow
