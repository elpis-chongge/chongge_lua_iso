require("RogueBuild01_InsideSmallByName")

function GetRogueBuild01_InsideSmallWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_InsideSmallUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
