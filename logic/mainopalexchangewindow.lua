require("Message_MainOpalExchangeWindowByName")
local MainOpalExchangeWindow = {}
local uis, contentPane, buyNum, itemInfo, wordId, priceNum

function MainOpalExchangeWindow.ReInitData()
end

function MainOpalExchangeWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.MainOpalExchangeWindow.package, WinResConfig.MainOpalExchangeWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetMessage_MainOpalExchangeWindowUis(contentPane)
    buyNum = 1
    wordId = 990
    MainOpalExchangeWindow.UpdateInfo()
    MainOpalExchangeWindow.InitBtn()
  end)
end

function MainOpalExchangeWindow.UpdateInfo()
  local addArr = GetDiamondConvertValue()
  if addArr and addArr.value then
    priceNum = addArr.value
    if wordId then
      uis.Main.MainOpalExchange1.WordTxt.text = T(wordId, buyNum, buyNum * addArr.value)
    end
    local numberStrip = uis.Main.MainOpalExchange1.OpalNumberStrip
    local totalNum = ActorData.GetItemCount(COMMON_ITEM_ID.RECHARGE_DIAMOND)
    local UpdateBuyNum = function()
      numberStrip.ChoiceNumberTxt.text = T(1025, buyNum, totalNum)
      uis.Main.MainOpalExchange1.WordTxt.text = T(wordId, buyNum, buyNum * addArr.value)
      ChangeUIController(numberStrip.MaxBtn, "c1", buyNum == totalNum and 1 or 0)
      ChangeUIController(numberStrip.AddBtn, "c1", buyNum == totalNum and 1 or 0)
      ChangeUIController(numberStrip.ReduceBtn, "c1", 1 == buyNum and 1 or 0)
      ChangeUIController(numberStrip.MinBtn, "c1", 1 == buyNum and 1 or 0)
      uis.Main.MainOpalExchange1.Number1.NumberTxt.text = T(1095, buyNum * addArr.value)
      uis.Main.MainOpalExchange1.Number2.NumberTxt.text = math.max(ActorData.GetItemCount(COMMON_ITEM_ID.RECHARGE_DIAMOND) - buyNum, 0)
    end
    buyNum = 1
    local longSpeed = 1
    UIUtil.SetText(numberStrip.MaxBtn, T(1024))
    UIUtil.SetText(numberStrip.MinBtn, T(1023))
    numberStrip.MaxBtn.onClick:Set(function()
      buyNum = totalNum
      UpdateBuyNum()
    end)
    numberStrip.MinBtn.onClick:Set(function()
      buyNum = 1
      UpdateBuyNum()
    end)
    numberStrip.AddBtn.onClick:Set(function()
      buyNum = math.min(buyNum + 1, totalNum)
      UpdateBuyNum()
    end)
    numberStrip.ReduceBtn.onClick:Set(function()
      buyNum = math.max(buyNum - 1, 1)
      UpdateBuyNum()
    end)
    local spNum = 1
    local gesture = MainOpalExchangeWindow.GetGesture(numberStrip.AddBtn)
    gesture.onAction:Set(function()
      if spNum > 5 then
        longSpeed = longSpeed + 1
        spNum = 1
      end
      buyNum = math.min(buyNum + longSpeed, totalNum)
      UpdateBuyNum()
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
    local gestureReduce = MainOpalExchangeWindow.GetGesture(numberStrip.ReduceBtn)
    gestureReduce.onAction:Set(function()
      if spNum > 5 then
        longSpeed = longSpeed + 1
        spNum = 1
      end
      buyNum = math.max(buyNum - longSpeed, 1)
      UpdateBuyNum()
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
    UpdateBuyNum()
  end
  UIUtil.SetIconById(uis.Main.MainOpalExchange1.Pic1Loader, COMMON_ITEM_ID.RECHARGE_DIAMOND)
  UIUtil.SetIconById(uis.Main.MainOpalExchange1.Pic2Loader, COMMON_ITEM_ID.BIND_DIAMOND)
end

function MainOpalExchangeWindow.GetGesture(btn)
  local gesture = LongPressGesture.GetLongPressGesture(btn)
  gesture.trigger = 0.5
  gesture.interval = 0.2
  return gesture
end

function MainOpalExchangeWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.MainOpalExchangeWindow.name)
end

function MainOpalExchangeWindow.InitBtn()
  UIUtil.SetPopupBtnGroup(uis.Main.Popup_Opal.BtnGroup.root, {
    touchCallback = function()
      if buyNum < 1 then
        FloatTipsUtil.ShowWarnTips(T(1096))
        return
      end
      itemInfo = ActorData.GetItemInfoById(COMMON_ITEM_ID.RECHARGE_DIAMOND)
      if nil == itemInfo or itemInfo.count < buyNum then
        OpenWindow(WinResConfig.DiamondWindow.name, nil, true)
        return
      end
      ld("Bag", function()
        BagService.UseItemReq(itemInfo.itemUid, buyNum, nil, function(msg)
          GetItemTips.Show(msg.items)
          MainOpalExchangeWindow.CloseWindow()
          RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.GACHA)
        end)
      end)
    end
  }, {
    touchCallback = MainOpalExchangeWindow.CloseWindow
  })
  uis.Main.TouchScreenBtn.onClick:Set(MainOpalExchangeWindow.CloseWindow)
end

function MainOpalExchangeWindow.OnClose()
  uis = nil
  contentPane = nil
  buyNum = nil
  itemInfo = nil
  wordId = nil
  priceNum = nil
end

return MainOpalExchangeWindow
