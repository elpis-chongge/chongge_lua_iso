require("RogueBuild01_InsideStartByName")

function GetRogueBuild01_InsideStartWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_InsideStartUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
