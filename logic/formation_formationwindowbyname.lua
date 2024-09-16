require("Formation_FormationByName")

function GetFormation_FormationWindowUis(ui)
  local uis = {}
  uis.Main = GetFormation_FormationUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
