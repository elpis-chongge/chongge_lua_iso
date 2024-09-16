require("Formation_RestraintTipsWindowByName")
local FormationRestraintTipsWindow = {}
local uis, contentPane

function FormationRestraintTipsWindow.ReInitData()
end

function FormationRestraintTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.FormationRestraintTipsWindow.package, WinResConfig.FormationRestraintTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetFormation_RestraintTipsWindowUis(contentPane)
    FormationRestraintTipsWindow.UpdateInfo()
    FormationRestraintTipsWindow.InitBtn()
  end)
end

function FormationRestraintTipsWindow.UpdateInfo()
end

function FormationRestraintTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Add(FormationRestraintTipsWindow.Close)
end

function FormationRestraintTipsWindow.Close()
  UIMgr:CloseWindow(WinResConfig.FormationRestraintTipsWindow.name)
end

function FormationRestraintTipsWindow.OnClose()
  uis = nil
  contentPane = nil
end

return FormationRestraintTipsWindow
