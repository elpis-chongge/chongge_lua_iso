require("RogueBuild01_DungeonInfo_TipsByName")

function GetRogueBuild01_InsideDungeonInfoUis(ui)
  local uis = {}
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.DungeonInfoTips = GetRogueBuild01_DungeonInfo_TipsUis(ui:GetChild("DungeonInfoTips"))
  uis.root = ui
  return uis
end
