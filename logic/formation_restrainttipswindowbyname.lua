require("Formation_RestraintTipsByName")

function GetFormation_RestraintTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetFormation_RestraintTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
