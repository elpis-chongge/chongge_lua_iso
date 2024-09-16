require("Shop_TokenExplainWindowByName")
local TokenExplainWindow = {}
local uis, contentPane

function TokenExplainWindow.ReInitData()
end

function TokenExplainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.TokenExplainWindow.package, WinResConfig.TokenExplainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetShop_TokenExplainWindowUis(contentPane)
    TokenExplainWindow.UpdateInfo()
    TokenExplainWindow.InitBtn()
  end)
end

function TokenExplainWindow.UpdateInfo()
  uis.Main.ExplainWord1.WordTxt.text = T(1019)
  uis.Main.ExplainWord2.WordTxt.text = T(1020)
  uis.Main.ExplainTitle.Title1Txt.text = T(1050)
  uis.Main.ExplainTitle.Title2Txt.text = T(1051)
  uis.Main.ExplainTitle.Title3Txt.text = T(1052)
end

function TokenExplainWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.TokenExplainWindow.name)
  end)
end

function TokenExplainWindow.OnClose()
  uis = nil
  contentPane = nil
end

return TokenExplainWindow
