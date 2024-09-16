require("RogueBuild01_InsideStartChoiceByName")

function GetRogueBuild01_InsideStartChoiceWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_InsideStartChoiceUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
