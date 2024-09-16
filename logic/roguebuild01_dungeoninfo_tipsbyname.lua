require("RogueBuild01_DungeonInfo_TitleByName")
require("RogueBuild01_DungeonInfo_MidByName")

function GetRogueBuild01_DungeonInfo_TipsUis(ui)
  local uis = {}
  uis.Title = GetRogueBuild01_DungeonInfo_TitleUis(ui:GetChild("Title"))
  uis.Mid = GetRogueBuild01_DungeonInfo_MidUis(ui:GetChild("Mid"))
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.root = ui
  return uis
end
