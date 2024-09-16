require("DungeonInfo_ExpeditionRegionByName")
require("DungeonInfo_RewardShowByName")
require("DungeonInfo_BossRegionByName")

function GetDungeonInfo_CollectionRegionUis(ui)
  local uis = {}
  uis.WordExplainList = ui:GetChild("WordExplainList")
  uis.ExpeditionRegion = GetDungeonInfo_ExpeditionRegionUis(ui:GetChild("ExpeditionRegion"))
  uis.RewardShow = GetDungeonInfo_RewardShowUis(ui:GetChild("RewardShow"))
  uis.BossRegion = GetDungeonInfo_BossRegionUis(ui:GetChild("BossRegion"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
