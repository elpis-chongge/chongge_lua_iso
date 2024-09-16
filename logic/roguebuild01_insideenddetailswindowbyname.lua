require("RogueBuild01_InsideEndDetailsByName")

function GetRogueBuild01_InsideEndDetailsWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_InsideEndDetailsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
