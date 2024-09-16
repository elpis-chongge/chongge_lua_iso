require("RogueBuild01_InsideCampByName")

function GetRogueBuild01_InsideCampWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_InsideCampUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
