require("CardAttribute_CardAttributeTipsWindowByName")
local CardAttributeTipsWindow = {}
local uis, contentPane, info

function CardAttributeTipsWindow.ReInitData()
end

function CardAttributeTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.CardAttributeTipsWindow.package, WinResConfig.CardAttributeTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetCardAttribute_CardAttributeTipsWindowUis(contentPane)
    info = bridgeObj.argTable[1]
    CardAttributeTipsWindow.UpdateInfo()
    CardAttributeTipsWindow.InitBtn()
  end)
end

function CardAttributeTipsWindow.UpdateInfo()
  if info then
    uis.Main.TipsWord.WordTxt.text = info.des
    uis.Main.TipsWord.TitleTxt.text = info.titleTxt
  end
end

function CardAttributeTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.CardAttributeTipsWindow.name)
  end)
end

function CardAttributeTipsWindow.OnClose()
  uis = nil
  contentPane = nil
end

return CardAttributeTipsWindow
