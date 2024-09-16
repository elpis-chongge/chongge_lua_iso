require("Formation_ExpeditionBuffTipsByName")

function GetFormation_ExpeditionBuffTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetFormation_ExpeditionBuffTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
