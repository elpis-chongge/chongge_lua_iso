require("Land_LandByName")

function GetLand_LandWindowUis(ui)
  local uis = {}
  uis.Main = GetLand_LandUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
