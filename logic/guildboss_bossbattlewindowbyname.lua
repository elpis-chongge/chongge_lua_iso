require("GuildBoss_BossBattleByName")

function GetGuildBoss_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetGuildBoss_BossBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
