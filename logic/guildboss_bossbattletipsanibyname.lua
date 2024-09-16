require("GuildBoss_BossBattleTipsByName")

function GetGuildBoss_BossBattleTipsAniUis(ui)
  local uis = {}
  uis.Tips = GetGuildBoss_BossBattleTipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
