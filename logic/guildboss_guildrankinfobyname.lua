require("GuildBoss_GuildRankInfoOwnByName")
require("GuildBoss_GuildRankInfoGuildByName")

function GetGuildBoss_GuildRankInfoUis(ui)
  local uis = {}
  uis.Own = GetGuildBoss_GuildRankInfoOwnUis(ui:GetChild("Own"))
  uis.Guild = GetGuildBoss_GuildRankInfoGuildUis(ui:GetChild("Guild"))
  uis.root = ui
  return uis
end
