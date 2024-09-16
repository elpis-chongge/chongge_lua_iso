require("GuildBoss_GuildRankRewardNumberByName")

function GetGuildBoss_GuildRankRewardTipsUis(ui)
  local uis = {}
  uis.RankRewardNumber = GetGuildBoss_GuildRankRewardNumberUis(ui:GetChild("RankRewardNumber"))
  uis.RewardList = ui:GetChild("RewardList")
  uis.root = ui
  return uis
end
