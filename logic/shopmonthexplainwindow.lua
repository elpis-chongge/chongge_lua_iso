require("Shop_MonthExplainWindowByName")
local ShopMonthExplainWindow = {}
local uis, contentPane

function ShopMonthExplainWindow.ReInitData()
end

function ShopMonthExplainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ShopMonthExplainWindow.package, WinResConfig.ShopMonthExplainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetShop_MonthExplainWindowUis(contentPane)
    local wordId = bridgeObj.argTable[1]
    ShopMonthExplainWindow.UpdateInfo(wordId)
    ShopMonthExplainWindow.InitBtn()
  end)
end

function ShopMonthExplainWindow.UpdateInfo(wordId)
  if wordId then
    uis.Main.MonthExplain.TitleTxt.text = T(1081)
    
    function uis.Main.MonthExplain.WordList.itemRenderer(i, item)
      UIUtil.SetText(item, T(wordId[i + 1]), "WordTxt")
    end
    
    uis.Main.MonthExplain.WordList.numItems = #wordId
  end
end

function ShopMonthExplainWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.ShopMonthExplainWindow.name)
end

function ShopMonthExplainWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(ShopMonthExplainWindow.CloseWindow)
  uis.Main.MonthExplain.CloseBtn.onClick:Set(ShopMonthExplainWindow.CloseWindow)
end

function ShopMonthExplainWindow.OnClose()
  uis = nil
  contentPane = nil
end

return ShopMonthExplainWindow
