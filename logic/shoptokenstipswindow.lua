require("Message_TokensTipsWindowByName")
local ShopTokensTipsWindow = {}
local uis, contentPane, curId, priceId, priceNum, shopData, shopGridData, itemData, serviceData, itemArr, itemNum, buyNum, totalNum, maxValue, longSpeed, isActivity, activityData

function ShopTokensTipsWindow.ReInitData()
end

function ShopTokensTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ShopTokensTipsWindow.package, WinResConfig.ShopTokensTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetMessage_TokensTipsWindowUis(contentPane)
    local tipsData = bridgeObj.argTable[2]
    activityData = bridgeObj.argTable[3]
    curId = bridgeObj.argTable[1]
    if tipsData and #tipsData >= 1 then
      UIUtil.InitAssetsTips(uis.Main.AssetsTipsGroup.AssetsTipsList, tipsData, true)
    end
    ShopTokensTipsWindow.UpdateInfo()
    ShopTokensTipsWindow.InitBtn()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.POPUP_WINDOW_SHOW)
  end)
end

function ShopTokensTipsWindow.CheckItemTime()
  if serviceData and serviceData.nextRefreshTime and serviceData.nextRefreshTime > 0 then
    uis.Main.root.onClick:Set(function()
      if serviceData.nextRefreshTime < LoginData.GetCurServerTime() then
        local name = itemData.name
        if name then
          FloatTipsUtil.ShowWarnTips(T(1064, name))
        else
          FloatTipsUtil.ShowWarnTips(T(556))
        end
        UIMgr:CloseWindow(WinResConfig.ShopTokensTipsWindow.name)
      end
    end)
  end
end

function ShopTokensTipsWindow.UpdateInfo()
  if activityData then
    isActivity = true
    shopData = TableData.GetConfig(curId, "BaseActivityShopGrid")
  else
    isActivity = nil
    shopData = TableData.GetConfig(curId, "BaseShopPool")
  end
  if shopData then
    if isActivity then
      serviceData = activityData
      shopGridData = {
        sell_limit_time = shopData.sell_limit_time
      }
    else
      serviceData = ShopData.GetShopGoodsInfoById(shopData.id)
      shopGridData = TableData.GetConfig(serviceData.gridId, "BaseShopGrid")
    end
    ShopTokensTipsWindow.InitToken()
    ShopTokensTipsWindow.CheckItemTime()
  end
end

function ShopTokensTipsWindow.GetMessageBoxTips(cardId, small)
  local str = ""
  local cardData = TableData.GetConfig(cardId, "BaseCard")
  if cardData then
    local cardInfo = CardData.GetCardDataById(cardId)
    local gradeLv = cardInfo and cardInfo.grade or 0
    local gradeId = cardId * 1000 + gradeLv
    local numBol = CardData.GetCardStarDebrisNum(gradeId) >= cardData.grade_max
    if cardInfo and (cardInfo.grade >= cardData.grade_max or numBol) then
      local arr = GetConfigItemList(cardData.change_item_full, true)
      for i, v in ipairs(arr) do
        local d = TableData.GetConfig(v.id, "BaseItem")
        if d then
          local iconStr = small and d.icon_small and d.icon_small or d.icon
          local icon = Split(iconStr, ":")
          str = T(839, icon[1], icon[2], d.name()) .. str
        end
      end
      if cardInfo.grade >= cardData.grade_max then
        str = T(836, str)
      else
        str = T(837, str)
      end
    else
      local arr = GetConfigItemList(cardData.change_item, true)
      for i, v in ipairs(arr) do
        local d = TableData.GetConfig(v.id, "BaseItem")
        if d then
          local iconStr = small and d.icon_small and d.icon_small or d.icon
          local icon = Split(iconStr, ":")
          str = T(839, icon[1], icon[2], d.name()) .. str
        end
      end
      str = T(838, str)
    end
  end
  return str
end

function ShopTokensTipsWindow.InitToken()
  local info = uis.Main.TokensTips.TokensTipsMain
  local arr = Split(isActivity and shopData.sell_price[1] or shopData.sell_price, ":")
  if 3 == #arr then
    priceId = tonumber(arr[2])
    priceNum = tonumber(arr[3])
  end
  ShopTokensTipsWindow.ShowDiscount(info.Discount, info.Price.Price1, info.Price.Price2, info.saleCtr)
  itemArr = Split(isActivity and shopData.item[1] or shopData.item, ":")
  itemNum = tonumber(itemArr[3])
  UIUtil.SetBtnText(info.DetailsBtn, T(1027))
  if 2 == tonumber(itemArr[1]) then
    buyNum = 1
    itemData = TableData.GetConfig(tonumber(itemArr[2]), "BaseCard")
    if itemData then
      function info.WordList.itemRenderer(i, word)
        UIUtil.SetText(word, itemData.des and itemData.des() or "")
      end
      
      info.WordList.numItems = 1
      UIUtil.SetHeadByFaceId(itemData.fashion_id, info.ItemPic.Pic2.IconLoader, HEAD_ICON_TYPE_ENUM.BANNER)
    end
    local list = info.root:GetChild("StarList")
    local cardInfo = CardData.GetCardDataById(itemData.id)
    if nil == cardInfo then
      info.HaveNumber.HaveNumberTxt.text = T(1022)
    else
      info.HaveNumber.HaveNumberTxt.text = T(1337)
    end
    UIUtil.ShowStarList(list, {grade = -1}, itemData)
    info.HaveNumber.root.visible = true
    info.ItemNumber.root.visible = false
    ChangeController(info.numberCtr, 1)
    ChangeController(info.c3Ctr, 1)
    info.DetailsBtn.onClick:Set(function()
      UIUtil.OpenPreviewTips(itemData.id, ProtoEnum.TUPLE_TYPE.CARD)
    end)
    info.NameTxt.text = itemData.name()
    ChangeController(info.c4Ctr, 1)
    if ActorData.GetItemCount(priceId) >= priceNum then
      ChangeController(info.c1Ctr, 0)
    else
      local data = TableData.GetConfig(priceId, "BaseItem")
      if data and data.name then
        info.Buy.LackWord.WordTxt.text = T(1066, data.name())
      end
      ChangeController(info.c1Ctr, 1)
    end
    local buyFun = function()
      if isActivity then
        ActivityDungeonService.ActivityStageShopBuyReq(buyNum, serviceData.gridId, function()
          UIMgr:CloseWindow(WinResConfig.ShopTokensTipsWindow.name)
        end)
      else
        ShopService.BuyShopGoodsReq(serviceData.gridId, buyNum, function()
          UIMgr:CloseWindow(WinResConfig.ShopTokensTipsWindow.name)
        end)
      end
    end
    UIUtil.SetBtnText(info.Buy.SureBtn, T(399), T(400))
    info.Buy.SureBtn.onClick:Set(function()
      if 0 == info.c1Ctr.selectedIndex then
        if CardData.GetCardDataById(itemData.id) then
          local str = ShopTokensTipsWindow.GetMessageBoxTips(itemData.id, true)
          MessageBox.Show(str, {touchCallback = buyFun})
        else
          buyFun()
        end
      end
    end)
  else
    itemData = TableData.GetConfig(tonumber(itemArr[2]), "BaseItem")
    if nil == itemData then
      itemData = TableData.GetConfig(tonumber(itemArr[2]), "BaseSound")
    end
    if itemData then
      function info.WordList.itemRenderer(i, word)
        if itemData.event_des then
          UIUtil.SetText(word, itemData.event_des and itemData.event_des() or "")
        else
          UIUtil.SetText(word, itemData.des and itemData.des() or "")
        end
      end
      
      info.WordList.numItems = 1
      info.ItemPic.Pic1.IconLoader.url = UIUtil.GetResUrl(itemData.icon)
      info.HaveNumber.HaveNumberTxt.text = T(475, ActorData.GetItemCount(itemData.id))
      info.ItemNumber.NumberTxt.text = itemNum
      ChangeController(info.ItemPic.Pic1.c1Ctr, itemData.quality)
      info.ItemNumber.root.visible = itemNum > 1
      info.NameTxt.text = itemData.name()
    end
    ShopTokensTipsWindow.ShowStripBuy(info.NumberStrip, info.Buy.AllPrice, info.numberCtr, info.c1Ctr, info.Buy.LackWord)
    local show = ShopTokensTipsWindow.OpenLookInfo()
    info.DetailsBtn.onClick:Set(function()
      if show then
        local tokensCard = uis.Main.TokensTips.TokensCard
        ShopTokensTipsWindow.UpdateBuyNum(tokensCard.NumberStrip, tokensCard.Buy.AllPrice)
        uis.Main.TokensTips.c1Ctr.selectedIndex = 1
      end
    end)
    ChangeController(info.c4Ctr, show and 1 or 0)
    ShopTokensTipsWindow.ShowBuyBtn(info.Buy.SureBtn)
  end
end

function ShopTokensTipsWindow.ShowDiscount(discount, price1, price2, saleCtr)
  if shopData.sell_type then
    price2.Price1Txt.text = T(1018)
    price2.PriceTxt.text = priceNum
    discount.DiscountTxt.text = T(1021, shopData.sell_type)
    price2.OriginalPriceTxt.text = shopData.sell_price_original
    UIUtil.SetIconById(price2.PriceLoader, priceId, true)
    saleCtr.selectedIndex = 1
  else
    price1.Price1Txt.text = T(1018)
    price1.PriceTxt.text = priceNum
    UIUtil.SetIconById(price1.PriceLoader, priceId, true)
    saleCtr.selectedIndex = 0
  end
end

function ShopTokensTipsWindow.UpdateBuyNum(NumberStrip, AllPrice)
  if maxValue then
    NumberStrip.ChoiceNumberTxt.text = T(1025, buyNum, totalNum)
    AllPrice.NumberTxt.text = Mathf.FloorToInt(buyNum * priceNum)
    ChangeUIController(NumberStrip.MaxBtn, "c1", buyNum == maxValue and 1 or 0)
    ChangeUIController(NumberStrip.AddBtn, "c1", buyNum == maxValue and 1 or 0)
    ChangeUIController(NumberStrip.ReduceBtn, "c1", 1 == buyNum and 1 or 0)
    ChangeUIController(NumberStrip.MinBtn, "c1", 1 == buyNum and 1 or 0)
  end
end

function ShopTokensTipsWindow.ShowStripBuy(NumberStrip, AllPrice, numberCtr, goldCtr, goldTips)
  totalNum = shopGridData.sell_limit_time - serviceData.boughtNum
  local ownCount = ActorData.GetItemCount(priceId)
  if -1 == shopGridData.sell_limit_time then
    maxValue = Mathf.FloorToInt(ownCount / priceNum)
    totalNum = math.max(Mathf.FloorToInt(ownCount / priceNum), 1)
  else
    maxValue = math.min(Mathf.FloorToInt(ownCount / priceNum), totalNum)
  end
  buyNum = 1
  longSpeed = 1
  UIUtil.SetText(NumberStrip.MaxBtn, T(1024))
  UIUtil.SetText(NumberStrip.MinBtn, T(1023))
  NumberStrip.MaxBtn.onClick:Set(function()
    buyNum = maxValue
    ShopTokensTipsWindow.UpdateBuyNum(NumberStrip, AllPrice)
  end)
  NumberStrip.MinBtn.onClick:Set(function()
    buyNum = 1
    ShopTokensTipsWindow.UpdateBuyNum(NumberStrip, AllPrice)
  end)
  NumberStrip.AddBtn.onClick:Set(function()
    buyNum = math.min(buyNum + 1, maxValue)
    ShopTokensTipsWindow.UpdateBuyNum(NumberStrip, AllPrice)
  end)
  NumberStrip.ReduceBtn.onClick:Set(function()
    buyNum = math.max(buyNum - 1, 1)
    ShopTokensTipsWindow.UpdateBuyNum(NumberStrip, AllPrice)
  end)
  AllPrice.WordTxt.text = T(1026)
  UIUtil.SetIconById(AllPrice.PicLoader, priceId, true)
  ShopTokensTipsWindow.UpdateBuyNum(NumberStrip, AllPrice)
  ChangeController(numberCtr, 0)
  if maxValue < 1 then
    ChangeController(goldCtr, 1)
    local itemConfig = TableData.GetConfig(priceId, "BaseItem")
    if itemConfig then
      goldTips.WordTxt.text = T(1066, itemConfig.name())
    end
    NumberStrip.ChoiceNumberTxt.text = T(1025, buyNum, totalNum)
    ChangeUIController(NumberStrip.MaxBtn, "c1", 1)
    ChangeUIController(NumberStrip.AddBtn, "c1", 1)
    ChangeUIController(NumberStrip.ReduceBtn, "c1", 1)
    ChangeUIController(NumberStrip.MinBtn, "c1", 1)
    NumberStrip.MaxBtn.touchable = false
    NumberStrip.AddBtn.touchable = false
    NumberStrip.ReduceBtn.touchable = false
    NumberStrip.MinBtn.touchable = false
  else
    NumberStrip.MaxBtn.touchable = true
    NumberStrip.AddBtn.touchable = true
    NumberStrip.ReduceBtn.touchable = true
    NumberStrip.MinBtn.touchable = true
    ChangeController(goldCtr, 0)
    local spNum = 1
    local gesture = ShopTokensTipsWindow.GetGesture(NumberStrip.AddBtn)
    gesture.onAction:Set(function()
      if spNum > 5 then
        longSpeed = longSpeed + 1
        spNum = 1
      end
      buyNum = math.min(buyNum + longSpeed, maxValue)
      ShopTokensTipsWindow.UpdateBuyNum(NumberStrip, AllPrice)
      spNum = spNum + 1
    end)
    gesture.onBegin:Set(function()
      longSpeed = 1
      spNum = 1
    end)
    gesture.onEnd:Set(function()
      longSpeed = 1
      spNum = 1
    end)
    local gestureReduce = ShopTokensTipsWindow.GetGesture(NumberStrip.ReduceBtn)
    gestureReduce.onAction:Set(function()
      if spNum > 5 then
        longSpeed = longSpeed + 1
        spNum = 1
      end
      buyNum = math.max(buyNum - longSpeed, 1)
      ShopTokensTipsWindow.UpdateBuyNum(NumberStrip, AllPrice)
      spNum = spNum + 1
    end)
    gestureReduce.onBegin:Set(function()
      longSpeed = 1
      spNum = 1
    end)
    gestureReduce.onEnd:Set(function()
      longSpeed = 1
      spNum = 1
    end)
  end
end

function ShopTokensTipsWindow.GetGesture(btn)
  local gesture = LongPressGesture.GetLongPressGesture(btn)
  gesture.trigger = 0.5
  gesture.interval = 0.2
  return gesture
end

function ShopTokensTipsWindow.ShowBuyBtn(SureBtn)
  UIUtil.SetBtnText(SureBtn, T(399), T(400))
  SureBtn.onClick:Set(function()
    local tGold = GetPreciseDecimal(priceNum * buyNum)
    local gold = ActorData.GetItemCount(priceId)
    if tGold <= gold then
      if isActivity then
        ActivityDungeonService.ActivityStageShopBuyReq(buyNum, serviceData.gridId, function()
          UIMgr:CloseWindow(WinResConfig.ShopTokensTipsWindow.name)
        end)
      else
        ShopService.BuyShopGoodsReq(serviceData.gridId, buyNum, function()
          UIMgr:CloseWindow(WinResConfig.ShopTokensTipsWindow.name)
        end)
      end
    else
      local itemConfig = TableData.GetConfig(priceId, "BaseItem")
      if itemConfig then
        FloatTipsUtil.ShowWarnTips(T(366, itemConfig.name()))
      end
    end
  end)
end

function ShopTokensTipsWindow.OpenLookInfo()
  local info = uis.Main.TokensTips.TokensCard
  local show = false
  local useType = false
  ShopTokensTipsWindow.ShowDiscount(info.Discount, info.Price1, info.Price2, info.saleCtr)
  ShopTokensTipsWindow.ShowStripBuy(info.NumberStrip, info.Buy.AllPrice, info.numberCtr, info.c1Ctr, info.Buy.LackWord)
  ShopTokensTipsWindow.ShowBuyBtn(info.Buy.SureBtn)
  info.BuyItemContent.NumberTxt.text = T(1028)
  if itemData then
    info.BuyItemContent.Item.ItemLoader.url = UIUtil.GetResUrl(itemData.icon)
    ChangeController(info.BuyItemContent.Item.c1Ctr, itemData.quality)
    info.BuyItemContent.Item.NumberTxt.text = T(1029, itemNum or 1)
    local type, cardData = ShopMgr.GetLookDetailsBtn(itemData.id, true)
    useType = type
    if #cardData > 0 then
      info.HeadList.selectedIndex = -1
      local cardInfo, badgeInfo
      
      function info.HeadList.itemRenderer(i, item)
        if type == USE_TYPE.CARD then
          cardInfo = cardData[i + 1].data
          local configData = TableData.GetConfig(cardInfo.cardId, "BaseCard")
          UIUtil.SetText(item, configData.name(), "NameTxt")
          ChangeUIController(item, "head", configData.star - 1)
          local fashionId = 0 == cardInfo.fashionId and configData.fashion_id or cardInfo.fashionId
          UIUtil.SetHeadByFaceId(fashionId, item:GetChild("HeadBg"):GetChild("CardPicLoader"), HEAD_ICON_TYPE_ENUM.RECT)
          item.onClick:Set(function()
            if info.HeadList.selectedIndex ~= i then
              ShopTokensTipsWindow.ShowDetailsInfo(cardData[i + 1], nil, type)
              info.HeadList.selectedIndex = i
            end
          end)
          ChangeUIController(item, "c2", 0)
        elseif type == USE_TYPE.BADGE then
          badgeInfo = cardData[i + 1].data
          local configData = TableData.GetConfig(badgeInfo.badgeId, "BaseBadge")
          if configData then
            UIUtil.SetText(item, configData.name(), "NameTxt")
            ChangeUIController(item, "badge", configData.star)
            item:GetChild("BadgeBg"):GetChild("CardPicLoader").url = UIUtil.GetResUrl(configData.icon)
          end
          item.onClick:Set(function()
            if info.HeadList.selectedIndex ~= i then
              ShopTokensTipsWindow.ShowDetailsInfo(nil, cardData[i + 1], type)
              info.HeadList.selectedIndex = i
            end
          end)
          ChangeUIController(item, "c2", 1)
        end
        if 0 == i then
          item.onClick:Call()
        end
      end
      
      info.HeadList.numItems = #cardData
      show = true
    end
  end
  if show then
    ChangeUIController(uis.Main.TokensTips.TokensTipsMain.DetailsBtn:GetChild("UseMark"), "c1", useType == USE_TYPE.CARD and 1 or 2)
  end
  return show
end

function ShopTokensTipsWindow.ShowDetailsInfo(card, badgeInfo, type)
  local info = uis.Main.TokensTips.TokensCard
  local page = 0
  local tempItem, width, DemandItem, len
  local nameType = {}
  local curNum = ActorData.GetItemCount(itemData.id)
  if type == USE_TYPE.CARD and card then
    local qualityLen = card.quality and 1 or 0
    len = card.skill and #card.skill + qualityLen or 1
    
    function info.DemandList.itemRenderer(i, item)
      width = item.width
      DemandItem = item:GetChild("DemandItem")
      if card.quality and 0 == i then
        ChangeUIController(item, "c1", 0)
        tempItem = item:GetChild("CardBreach")
        ChangeUIController(tempItem:GetChild("CardBreach1"), "c1", card.data.quality)
        ChangeUIController(tempItem:GetChild("CardBreach2"), "c1", math.min(card.data.quality + 1, 3))
        UIUtil.SetText(DemandItem, T(1030, curNum, card.qualityNum), "NumberTxt")
        nameType[i + 1] = 1031
      else
        nameType[i + 1] = 1032
        ChangeUIController(item, "c1", 1)
        if card.skill[i + 1] then
          local skillData = TableData.GetConfig(card.skill[i + 1].id, "BaseSkill")
          if skillData then
            tempItem = item:GetChild("CardSkill")
            tempItem:GetChild("Pic1Loader").url = UIUtil.GetResUrl(skillData.icon)
            tempItem:GetChild("Pic2Loader").url = UIUtil.GetResUrl(skillData.icon)
            UIUtil.SetText(tempItem, card.skill[i + 1].lv, "Level1Txt")
            UIUtil.SetText(tempItem, math.min(card.skill[i + 1].lv + 1, 3), "Level2Txt")
          end
          UIUtil.SetText(DemandItem, T(1030, curNum, card.skill[i + 1].num), "NumberTxt")
        end
      end
      DemandItem:GetChild("ItemLoader").url = UIUtil.GetResUrl(itemData.icon)
      ChangeUIController(DemandItem, "c1", itemData.quality)
    end
    
    info.DemandList.numItems = len
  else
    function info.DemandList.itemRenderer(i, item)
      width = item.width
      
      DemandItem = item:GetChild("DemandItem")
      tempItem = item:GetChild("BadgeStar")
      nameType[i + 1] = 1033
      ChangeUIController(tempItem:GetChild("BadgeStar1"), "c1", badgeInfo.data.level)
      ChangeUIController(tempItem:GetChild("BadgeStar1"), "c1", math.min(badgeInfo.data.level + 1, 3))
      ChangeUIController(item, "c1", 2)
      DemandItem:GetChild("ItemLoader").url = UIUtil.GetResUrl(itemData.icon)
      ChangeUIController(DemandItem, "c1", itemData.quality)
      UIUtil.SetText(DemandItem, T(1030, curNum, badgeInfo.num), "NumberTxt")
    end
    
    info.DemandList.numItems = 1
  end
  info.DemandList.scrollPane.onScrollEnd:Set(function()
    if len > 1 then
      page = math.ceil(info.DemandList.scrollPane.posX / width)
      if nameType[page + 1] then
        info.NameTxt.text = T(nameType[page + 1])
      end
      info.PageList.numItems = len
    end
  end)
  
  function info.PageList.itemRenderer(i, item)
    ChangeUIController(item, "c1", page == i and 1 or 0)
  end
  
  info.DemandList.scrollPane.onScrollEnd:Call()
  if nameType[1] then
    info.NameTxt.text = T(nameType[1])
  end
end

function ShopTokensTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    if 1 == uis.Main.TokensTips.c1Ctr.selectedIndex then
      local info = uis.Main.TokensTips.TokensTipsMain
      ShopTokensTipsWindow.UpdateBuyNum(info.NumberStrip, info.Buy.AllPrice)
      uis.Main.TokensTips.c1Ctr.selectedIndex = 0
      return
    end
    UIMgr:CloseWindow(WinResConfig.ShopTokensTipsWindow.name)
  end)
end

function ShopTokensTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  curId = nil
  priceId = nil
  priceNum = nil
  shopData = nil
  shopGridData = nil
  itemData = nil
  serviceData = nil
  itemArr = nil
  itemNum = nil
  buyNum = nil
end

return ShopTokensTipsWindow
