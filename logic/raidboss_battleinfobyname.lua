require("RaidBoss_BattleRoundByName")
require("RaidBoss_BattleNumberByName")

function GetRaidBoss_BattleInfoUis(ui)
  local uis = {}
  uis.BattleRound = GetRaidBoss_BattleRoundUis(ui:GetChild("BattleRound"))
  uis.BattleNumber = GetRaidBoss_BattleNumberUis(ui:GetChild("BattleNumber"))
  uis.HeadList = ui:GetChild("HeadList")
  uis.TestBattleBtn = ui:GetChild("TestBattleBtn")
  uis.GoBattleBtn = ui:GetChild("GoBattleBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
