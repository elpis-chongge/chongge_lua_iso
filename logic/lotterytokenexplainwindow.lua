require("ShopTips_TokenExplainWindowByName")
local LotteryTokenExplainWindow = {}
local uis, contentPane

function LotteryTokenExplainWindow.ReInitData()
end

function LotteryTokenExplainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.LotteryTokenExplainWindow.package, WinResConfig.LotteryTokenExplainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetShopTips_TokenExplainWindowUis(contentPane)
    LotteryTokenExplainWindow.UpdateInfo()
    LotteryTokenExplainWindow.InitBtn()
  end)
end

function LotteryTokenExplainWindow.UpdateInfo()
  uis.Main.ExplainWord1.WordTxt.text = T(1019)
  uis.Main.ExplainWord2.WordTxt.text = T(1020)
  uis.Main.ExplainTitle.Title1Txt.text = T(1050)
  uis.Main.ExplainTitle.Title2Txt.text = T(1051)
  uis.Main.ExplainTitle.Title3Txt.text = T(1052)
end

function LotteryTokenExplainWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.LotteryTokenExplainWindow.name)
  end)
end

function LotteryTokenExplainWindow.OnClose()
  uis = nil
  contentPane = nil
end

return LotteryTokenExplainWindow
