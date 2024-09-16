require("RaidBoss_BossNameByName")
require("RaidBoss_BattleNumberByName")
require("RaidBoss_BattleClearByName")

function GetRaidBoss_BattleBeforeInfoUis(ui)
  local uis = {}
  uis.BossName = GetRaidBoss_BossNameUis(ui:GetChild("BossName"))
  uis.BattleNumber = GetRaidBoss_BattleNumberUis(ui:GetChild("BattleNumber"))
  uis.GoBattleBtn = ui:GetChild("GoBattleBtn")
  uis.BattleClear = GetRaidBoss_BattleClearUis(ui:GetChild("BattleClear"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
