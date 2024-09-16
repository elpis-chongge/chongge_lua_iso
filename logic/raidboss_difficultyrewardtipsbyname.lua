require("RaidBoss_DifficultyRewardNumberByName")
require("RaidBoss_DifficultyRewardTipsProgressByName")

function GetRaidBoss_DifficultyRewardTipsUis(ui)
  local uis = {}
  uis.DifficultyRewardNumber = GetRaidBoss_DifficultyRewardNumberUis(ui:GetChild("DifficultyRewardNumber"))
  uis.RewardList = ui:GetChild("RewardList")
  uis.Progress = GetRaidBoss_DifficultyRewardTipsProgressUis(ui:GetChild("Progress"))
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
