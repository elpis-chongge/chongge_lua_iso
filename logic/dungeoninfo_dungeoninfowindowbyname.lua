require("DungeonInfo_DungeonInfoByName")

function GetDungeonInfo_DungeonInfoWindowUis(ui)
  local uis = {}
  uis.Main = GetDungeonInfo_DungeonInfoUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
