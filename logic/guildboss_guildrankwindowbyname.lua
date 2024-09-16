require("GuildBoss_GuildRankByName")

function GetGuildBoss_GuildRankWindowUis(ui)
  local uis = {}
  uis.Main = GetGuildBoss_GuildRankUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
