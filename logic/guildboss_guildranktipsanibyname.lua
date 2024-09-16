require("GuildBoss_GuildRankTipsByName")

function GetGuildBoss_GuildRankTipsAniUis(ui)
  local uis = {}
  uis.RankTips = GetGuildBoss_GuildRankTipsUis(ui:GetChild("RankTips"))
  uis.root = ui
  return uis
end
