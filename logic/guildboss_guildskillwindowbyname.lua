require("GuildBoss_GuildSkillByName")

function GetGuildBoss_GuildSkillWindowUis(ui)
  local uis = {}
  uis.Main = GetGuildBoss_GuildSkillUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
