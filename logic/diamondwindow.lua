require("DiamondTips_DiamondWindowByName")
local DiamondWindow = {}
local uis, contentPane, notShopReopen

function DiamondWindow.ReInitData()
end

function DiamondWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.DiamondWindow.package, WinResConfig.DiamondWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    notShopReopen = bridgeObj.argTable[1]
    uis = GetDiamondTips_DiamondWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.DIAMOND_GET)
    DiamondWindow.UpdateInfo()
    DiamondWindow.InitBtn()
  end)
end

function DiamondWindow.UpdateInfo()
  local data = TableData.GetConfig(COMMON_ITEM_ID.RECHARGE_DIAMOND, "BaseItem")
  if data then
    uis.Main.NameTxt.text = data.name()
    uis.Main.WordTxt.text = data.remark()
  end
  uis.Main.TipsTxt.text = T(980)
  UIUtil.SetBtnText(uis.Main.GoToBtn, T(981), T(982))
end

function DiamondWindow.InitBtn()
  uis.Main.GoToBtn.onClick:Set(function()
    CurrencyReturnWindow.jumpShop(false, nil, 2, nil, notShopReopen)
  end)
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.DiamondWindow.name)
  end)
end

function DiamondWindow.OnClose()
  uis = nil
  contentPane = nil
  notShopReopen = nil
end

return DiamondWindow
