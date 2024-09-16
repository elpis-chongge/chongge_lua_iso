require("RaidBoss_RankRewardNumberByName")

function GetRaidBoss_RankRewardTipsUis(ui)
  local uis = {}
  uis.RankRewardNumber = GetRaidBoss_RankRewardNumberUis(ui:GetChild("RankRewardNumber"))
  uis.RewardList = ui:GetChild("RewardList")
  uis.root = ui
  return uis
end
