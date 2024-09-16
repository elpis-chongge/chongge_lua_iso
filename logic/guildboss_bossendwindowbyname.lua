require("GuildBoss_BossEndByName")

function GetGuildBoss_BossEndWindowUis(ui)
  local uis = {}
  uis.Main = GetGuildBoss_BossEndUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
