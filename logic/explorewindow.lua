require("Explore_ExploreWindowByName")
local ExploreWindow = {}
local uis, contentPane

function ExploreWindow.ReInitData()
end

function ExploreWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ExploreWindow.package, WinResConfig.ExploreWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExplore_ExploreWindowUis(contentPane)
    ExploreWindow.UpdateInfo()
    ExploreWindow.InitBtn()
  end)
end

function ExploreWindow.UpdateInfo()
  CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ExploreWindow.name, uis.Main.CurrencyReturn)
  UIUtil.SetText(uis.Main.TouchWord.root, T(20483), "WordTxt")
  UIUtil.SetText(uis.Main.Word.root, T(20542), "WordTxt")
end

function ExploreWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    OpenWindow(WinResConfig.ExploreAFKWindow.name)
  end)
end

function ExploreWindow.OnClose()
  uis = nil
  contentPane = nil
end

return ExploreWindow
