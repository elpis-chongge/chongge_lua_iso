require("TideDungeon_TideTitleByName")
require("TideDungeon_TideTimeByName")
require("TideDungeon_TabRegionByName")

function GetTideDungeon_TideRegionUis(ui)
  local uis = {}
  uis.Title = GetTideDungeon_TideTitleUis(ui:GetChild("Title"))
  uis.Time = GetTideDungeon_TideTimeUis(ui:GetChild("Time"))
  uis.RewardBtn = ui:GetChild("RewardBtn")
  uis.TipsList = ui:GetChild("TipsList")
  uis.TabRegion = GetTideDungeon_TabRegionUis(ui:GetChild("TabRegion"))
  uis.root = ui
  return uis
end
