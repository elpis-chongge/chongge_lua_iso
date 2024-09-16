require("RogueBuild01_Camp_RecoveryTipsByName")

function GetRogueBuild01_Camp_RecoveryTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_Camp_RecoveryTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
