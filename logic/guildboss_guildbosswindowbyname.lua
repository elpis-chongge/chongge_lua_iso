require("GuildBoss_GuildBossByName")

function GetGuildBoss_GuildBossWindowUis(ui)
  local uis = {}
  uis.Main = GetGuildBoss_GuildBossUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
