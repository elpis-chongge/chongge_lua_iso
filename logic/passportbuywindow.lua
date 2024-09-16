require("Passport_BuyWindowByName")
local PassportBuyWindow = {}
local uis, contentPane, productId

function PassportBuyWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.PassportBuyWindow.package, WinResConfig.PassportBuyWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetPassport_BuyWindowUis(contentPane)
    PassportBuyWindow.InitBtn()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.POPUP_WINDOW_SHOW)
    PassportBuyWindow.Init()
  end)
end

function PassportBuyWindow.Init()
  local info = ShopData.productInfo[ProtoEnum.PRODUCT_TYPE.PT_BATTLE_PASS]
  if info and info[1] then
    local PayData = TableData.GetConfig(info[1].id, "BasePayProduct")
    if PayData then
      productId = PayData.id
      uis.Main.PriceTxt.text = T(753, PayData.price)
    end
  end
end

function PassportBuyWindow.Close()
  UIMgr:CloseWindow(WinResConfig.PassportBuyWindow.name)
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.POPUP_WINDOW_CLOSE)
end

function PassportBuyWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(PassportBuyWindow.Close)
  uis.Main.BuyItemBtn.onClick:Set(function()
    if productId then
      ShopMgr.BuyProduct(productId, function()
        UIMgr:SendWindowMessage(WinResConfig.PassportWindow.name, WindowMsgEnum.Passport.ACTIVATE)
      end)
    end
  end)
  UIUtil.SetBtnText(uis.Main.BuyItemBtn, T(724), T(725))
end

function PassportBuyWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Passport.ACTIVATE then
    PassportBuyWindow.Close()
  end
end

function PassportBuyWindow.OnClose()
  uis = nil
  contentPane = nil
  productId = nil
end

return PassportBuyWindow
