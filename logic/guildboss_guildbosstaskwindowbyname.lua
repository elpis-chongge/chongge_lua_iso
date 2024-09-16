require("GuildBoss_GuildBossTaskByName")

function GetGuildBoss_GuildBossTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetGuildBoss_GuildBossTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
