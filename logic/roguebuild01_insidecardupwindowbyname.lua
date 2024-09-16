require("RogueBuild01_InsideCardUpByName")

function GetRogueBuild01_InsideCardUpWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_InsideCardUpUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
