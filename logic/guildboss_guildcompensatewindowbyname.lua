require("GuildBoss_GuildCompensateByName")

function GetGuildBoss_GuildCompensateWindowUis(ui)
  local uis = {}
  uis.Main = GetGuildBoss_GuildCompensateUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
