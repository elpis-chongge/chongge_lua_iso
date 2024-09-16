require("RogueBuild01_InsideDungeonInfoByName")

function GetRogueBuild01_InsideDungeonInfoWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_InsideDungeonInfoUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
