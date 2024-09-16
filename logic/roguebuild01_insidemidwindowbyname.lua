require("RogueBuild01_InsideMidByName")

function GetRogueBuild01_InsideMidWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_InsideMidUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
