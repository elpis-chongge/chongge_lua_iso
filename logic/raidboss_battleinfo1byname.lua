require("RaidBoss_BossHPInfoByName")
require("RaidBoss_BattleNumberRegionByName")

function GetRaidBoss_BattleInfo1Uis(ui)
  local uis = {}
  uis.BossHPInfo = GetRaidBoss_BossHPInfoUis(ui:GetChild("BossHPInfo"))
  uis.BattleNumberRegion = GetRaidBoss_BattleNumberRegionUis(ui:GetChild("BattleNumberRegion"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
