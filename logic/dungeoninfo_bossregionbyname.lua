require("DungeonInfo_BossInfoByName")
require("DungeonInfo_PlayerInfoRegionByName")

function GetDungeonInfo_BossRegionUis(ui)
  local uis = {}
  uis.PlayerRankBtn = ui:GetChild("PlayerRankBtn")
  uis.BattleRecordBtn = ui:GetChild("BattleRecordBtn")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.WordExplainList = ui:GetChild("WordExplainList")
  uis.BossInfo = GetDungeonInfo_BossInfoUis(ui:GetChild("BossInfo"))
  uis.PlayerInfoRegion = GetDungeonInfo_PlayerInfoRegionUis(ui:GetChild("PlayerInfoRegion"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
