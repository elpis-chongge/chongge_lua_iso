require("GuildBoss_GuildBossTaskTipsByName")

function GetGuildBoss_GuildBossTaskTipsAniUis(ui)
  local uis = {}
  uis.Tips = GetGuildBoss_GuildBossTaskTipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
