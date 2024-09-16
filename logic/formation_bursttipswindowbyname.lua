require("Formation_BurstTipsByName")

function GetFormation_BurstTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetFormation_BurstTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
