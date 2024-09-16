require("DungeonInfo_TitleByName")
require("DungeonInfo_CollectionRegionByName")
require("DungeonInfo_BattleBtnRegionByName")

function GetDungeonInfo_DungeonInfoTipsUis(ui)
  local uis = {}
  uis.Title = GetDungeonInfo_TitleUis(ui:GetChild("Title"))
  uis.CollectionRegion = GetDungeonInfo_CollectionRegionUis(ui:GetChild("CollectionRegion"))
  uis.BattleBtnRegion = GetDungeonInfo_BattleBtnRegionUis(ui:GetChild("BattleBtnRegion"))
  uis.NumberLabelList = ui:GetChild("NumberLabelList")
  uis.root = ui
  return uis
end
