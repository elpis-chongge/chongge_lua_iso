require("RaidBoss_DifficultyByName")
require("RaidBoss_BattleNumberRecordByName")
require("RaidBoss_BattleBeforeInfoByName")

function GetRaidBoss_BossMainUis(ui)
  local uis = {}
  uis.Difficulty = GetRaidBoss_DifficultyUis(ui:GetChild("Difficulty"))
  uis.BattleNumberRecord = GetRaidBoss_BattleNumberRecordUis(ui:GetChild("BattleNumberRecord"))
  uis.LeftArrowBtn = ui:GetChild("LeftArrowBtn")
  uis.RightArrowBtn = ui:GetChild("RightArrowBtn")
  uis.BattleBeforeInfo = GetRaidBoss_BattleBeforeInfoUis(ui:GetChild("BattleBeforeInfo"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
