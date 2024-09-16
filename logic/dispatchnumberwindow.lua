require("Message_DispatchNumberWindowByName")
local DispatchNumberWindow = {}
local uis, contentPane

function DispatchNumberWindow.ReInitData()
end

local stageId, buyNum, valueMin, valueMax, perCostValue

function DispatchNumberWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.DispatchNumberWindow.package, WinResConfig.DispatchNumberWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    stageId = bridgeObj.argTable[1]
    uis = GetMessage_DispatchNumberWindowUis(contentPane)
    local stageConfig = TableData.GetConfig(stageId, "BaseStage")
    local arr = GetConfigItemList(stageConfig.cost)
    arr = arr[COMMON_ITEM_ID.ENERGY]
    valueMin = 1
    perCostValue = arr.value
    valueMax = math.floor(ActorData.GetItemCount(COMMON_ITEM_ID.ENERGY) / perCostValue)
    local configMax = TableData.GetConfig(70010205, "BaseFixed").int_value
    valueMax = math.min(valueMax, configMax)
    DispatchNumberWindow.InitText()
    DispatchNumberWindow.UpdateInfo()
    DispatchNumberWindow.InitBtn()
  end)
end

function DispatchNumberWindow.InitText()
  uis.Main.DispatchNumber1.WordTxt.text = T(10751)
end

function DispatchNumberWindow.UpdateInfo()
  buyNum = 1
  local numberStrip = uis.Main.DispatchNumber1.NumberStrip
  local UpdateBuyNum = function()
    numberStrip.ChoiceNumberTxt.text = T(1025, buyNum, valueMax)
    uis.Main.DispatchNumber1.ReasonTxt.text = T(10753, ActorData.GetItemCount(COMMON_ITEM_ID.ENERGY), perCostValue * buyNum, ActorData.GetEnergyMax())
    ChangeUIController(numberStrip.MaxBtn, "c1", buyNum == valueMax and 1 or 0)
    ChangeUIController(numberStrip.AddBtn, "c1", buyNum == valueMax and 1 or 0)
    ChangeUIController(numberStrip.ReduceBtn, "c1", 1 == buyNum and 1 or 0)
    ChangeUIController(numberStrip.MinBtn, "c1", 1 == buyNum and 1 or 0)
  end
  local longSpeed = 1
  UIUtil.SetText(numberStrip.MaxBtn, T(1024))
  UIUtil.SetText(numberStrip.MinBtn, T(1023))
  numberStrip.MaxBtn.onClick:Set(function()
    buyNum = valueMax
    UpdateBuyNum()
  end)
  numberStrip.MinBtn.onClick:Set(function()
    buyNum = 1
    UpdateBuyNum()
  end)
  numberStrip.AddBtn.onClick:Set(function()
    buyNum = math.min(buyNum + 1, valueMax)
    UpdateBuyNum()
  end)
  numberStrip.ReduceBtn.onClick:Set(function()
    buyNum = math.max(buyNum - 1, 1)
    UpdateBuyNum()
  end)
  local spNum = 1
  local gesture = DispatchNumberWindow.GetGesture(numberStrip.AddBtn)
  gesture.onAction:Set(function()
    if spNum > 5 then
      longSpeed = longSpeed + 1
      spNum = 1
    end
    buyNum = math.min(buyNum + longSpeed, valueMax)
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
  local gestureReduce = DispatchNumberWindow.GetGesture(numberStrip.ReduceBtn)
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

function DispatchNumberWindow.GetGesture(btn)
  local longPress = LongPressGesture.GetLongPressGesture(btn)
  longPress.trigger = 0.5
  longPress.interval = 0.2
  return longPress
end

function DispatchNumberWindow.InitBtn()
  UIUtil.SetPopupBtnGroup(uis.Main.Popup_B.BtnGroup.root, {
    touchCallback = function()
      if buyNum < 1 then
        FloatTipsUtil.ShowWarnTips(T(936))
        return
      end
      ld("Battle", function()
        UIMgr:CloseWindow(WinResConfig.DungeonInfoWindow.name)
        BattleDispatch.StartDispatch(stageId, buyNum)
      end)
    end
  }, {
    touchCallback = DispatchNumberWindow.CloseWindow
  })
  uis.Main.TouchScreenBtn.onClick:Add(DispatchNumberWindow.CloseWindow)
end

function DispatchNumberWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.DispatchNumberWindow.name)
end

function DispatchNumberWindow.OnShown()
end

function DispatchNumberWindow.OnHide()
end

function DispatchNumberWindow.OnClose()
  buyNum = nil
  stageId = nil
  valueMin, valueMax = nil, nil
  perCostValue = nil
  uis = nil
  contentPane = nil
end

function DispatchNumberWindow.HandleMessage(msgId, para)
end

return DispatchNumberWindow
