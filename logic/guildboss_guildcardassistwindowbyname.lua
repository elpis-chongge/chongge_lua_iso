require("GuildBoss_GuildCardAssistByName")

function GetGuildBoss_GuildCardAssistWindowUis(ui)
  local uis = {}
  uis.Main = GetGuildBoss_GuildCardAssistUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
