require("Expedition_GiveUpWindowByName")
local ExpeditionGiveUpWindow = {}
local uis, contentPane

function ExpeditionGiveUpWindow.ReInitData()
end

function ExpeditionGiveUpWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ExpeditionGiveUpWindow.package, WinResConfig.ExpeditionGiveUpWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExpedition_GiveUpWindowUis(contentPane)
    ExpeditionGiveUpWindow.UpdateInfo()
    ExpeditionGiveUpWindow.InitBtn()
  end)
end

function ExpeditionGiveUpWindow.UpdateInfo()
  uis.Main.NameTxt.text = T(20070)
  uis.Main.SubtitleTxt.text = T(20071)
end

function ExpeditionGiveUpWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseToWindow(WinResConfig.ExpeditionWindow.name)
  end)
end

function ExpeditionGiveUpWindow.OnClose()
  uis = nil
  contentPane = nil
end

return ExpeditionGiveUpWindow
