require("GuildBoss_GuildBossTaskProgressFillByName")

function GetGuildBoss_GuildBossTaskProgressBarUis(ui)
  local uis = {}
  uis.bar = GetGuildBoss_GuildBossTaskProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
