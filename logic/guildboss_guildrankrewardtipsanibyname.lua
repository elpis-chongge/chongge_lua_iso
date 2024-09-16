require("GuildBoss_GuildRankRewardTipsByName")

function GetGuildBoss_GuildRankRewardTipsAniUis(ui)
  local uis = {}
  uis.RankRewardTips = GetGuildBoss_GuildRankRewardTipsUis(ui:GetChild("RankRewardTips"))
  uis.root = ui
  return uis
end
