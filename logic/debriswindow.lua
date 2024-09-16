require("Message_DebrisWindowByName")
local DebrisWindow = {}
local uis, contentPane, targetId, itemId

function DebrisWindow.ReInitData()
end

function DebrisWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.DebrisWindow.package, WinResConfig.DebrisWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetMessage_DebrisWindowUis(contentPane)
    targetId = bridgeObj.argTable[1]
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.CARD_DEBRIS)
    DebrisWindow.InitBtn()
    DebrisWindow.UpdateTextDisplay()
    DebrisWindow.InitInfo()
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/ExchangeItem/FX_ui_exchangeitem_loop.prefab", uis.Main.EffectHolder)
  end)
end

function DebrisWindow.InitInfo()
  itemId = CardMgr.GetItemIdByStarLv(CardMgr.cardConfigData.star)
  if itemId and targetId then
    local itemCount = ActorData.GetItemCount(itemId)
    local targetNum = ActorData.GetItemCount(targetId)
    UIUtil.ShowItemFrame(itemId, uis.Main.Item1.root, itemCount < 1 and T(985) or itemCount)
    UIUtil.ShowItemFrame(targetId, uis.Main.Item2.root)
    if targetNum < 1 then
      ChangeUIController(uis.Main.Item2.root, "number", 1)
    else
      uis.Main.Item2.NumberTxt.text = targetNum
      ChangeUIController(uis.Main.Item2.root, "number", 0)
    end
    if itemCount < 1 then
      uis.Main.TipsTxt.text = T(979)
      ChangeController(uis.Main.c1Ctr, 1)
      uis.Main.WordTxt.text = ""
      uis.Main.EffectHolder.visible = false
    elseif targetNum >= 5 - CardMgr.cardInfoData.grade then
      uis.Main.TipsTxt.text = T(90)
      ChangeController(uis.Main.c1Ctr, 2)
      uis.Main.WordTxt.text = ""
      uis.Main.EffectHolder.visible = false
    else
      uis.Main.EffectHolder.visible = true
      uis.Main.WordTxt.text = T(69)
      ChangeController(uis.Main.c1Ctr, 0)
    end
    uis.Main.SureBtn.onClick:Set(function()
      MessageService.ExchangeCardFragmentReq(itemId, 1, targetId)
    end)
  end
end

function DebrisWindow.UpdateTextDisplay()
  UIUtil.SetBtnText(uis.Main.SureBtn, T(55), T(49))
end

function DebrisWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.DebrisWindow.name)
  end)
end

function DebrisWindow.OnShown()
end

function DebrisWindow.OnHide()
end

function DebrisWindow.OnClose()
  uis = nil
  contentPane = nil
  targetId = nil
  itemId = nil
end

function DebrisWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.CardWindow.CHANGE_CARD then
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/ExchangeItem/FX_ui_exchangeitem_press.prefab", uis.Main.Effect1Holder, nil, true)
    FloatTipsUtil.AddPopupItem(targetId, 1)
    TimerUtil.setTimeout(0.36, function()
      DebrisWindow.InitInfo()
    end)
    CardStarUpWindow.RefreshDebrisExchange()
    UIMgr:SendWindowMessage(WinResConfig.CardDetailsWindow.name, WindowMsgEnum.CardWindow.CHANGE_CARD)
  end
end

return DebrisWindow
