require("CardAttribute_CardAttributeTipsWindowByName")
local BadgeCardAttributeTipsWindow = {}
local uis, contentPane, info

function BadgeCardAttributeTipsWindow.ReInitData()
end

function BadgeCardAttributeTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BadgeCardAttributeTipsWindow.package, WinResConfig.BadgeCardAttributeTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetCardAttribute_CardAttributeTipsWindowUis(contentPane)
    info = bridgeObj.argTable[1]
    BadgeCardAttributeTipsWindow.UpdateInfo()
    BadgeCardAttributeTipsWindow.InitBtn()
  end)
end

function BadgeCardAttributeTipsWindow.UpdateInfo()
  if info then
    uis.Main.TipsWord.WordTxt.text = info.des
    uis.Main.TipsWord.TitleTxt.text = info.titleTxt
  end
end

function BadgeCardAttributeTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.BadgeCardAttributeTipsWindow.name)
  end)
end

function BadgeCardAttributeTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  info = nil
end

return BadgeCardAttributeTipsWindow
