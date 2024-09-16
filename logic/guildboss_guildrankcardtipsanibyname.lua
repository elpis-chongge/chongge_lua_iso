require("GuildBoss_GuildRankCardTipsByName")

function GetGuildBoss_GuildRankCardTipsAniUis(ui)
  local uis = {}
  uis.RankTips = GetGuildBoss_GuildRankCardTipsUis(ui:GetChild("RankTips"))
  uis.root = ui
  return uis
end
