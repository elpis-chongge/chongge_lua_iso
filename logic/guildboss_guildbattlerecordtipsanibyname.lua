require("GuildBoss_GuildBattleRecordTipsByName")

function GetGuildBoss_GuildBattleRecordTipsAniUis(ui)
  local uis = {}
  uis.RankTips = GetGuildBoss_GuildBattleRecordTipsUis(ui:GetChild("RankTips"))
  uis.root = ui
  return uis
end
