require("Shop_OneYuanPassTipsWindowByName")
local OneYuanPassTipsWindow = {}
local uis, contentPane

function OneYuanPassTipsWindow.ReInitData()
end

function OneYuanPassTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.OneYuanPassTipsWindow.package, WinResConfig.OneYuanPassTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetShop_OneYuanPassTipsWindowUis(contentPane)
    OneYuanPassTipsWindow.UpdateInfo()
    OneYuanPassTipsWindow.InitBtn()
  end)
end

function OneYuanPassTipsWindow.UpdateInfo()
  uis.Main.WordTxt.text = T(1512)
  uis.Main.NameTxt.text = T(1511)
end

function OneYuanPassTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(OneYuanPassTipsWindow.CloseWindow)
end

function OneYuanPassTipsWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.OneYuanPassTipsWindow.name)
end

function OneYuanPassTipsWindow.OnClose()
  uis = nil
  contentPane = nil
end

return OneYuanPassTipsWindow
