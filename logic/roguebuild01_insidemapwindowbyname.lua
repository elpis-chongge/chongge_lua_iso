require("RogueBuild01_InsideMapByName")

function GetRogueBuild01_InsideMapWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_InsideMapUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
