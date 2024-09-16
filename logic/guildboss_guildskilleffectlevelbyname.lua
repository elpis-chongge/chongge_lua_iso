require("GuildBoss_GuildSkillEffectLevelSignByName")

function GetGuildBoss_GuildSkillEffectLevelUis(ui)
  local uis = {}
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Sign = GetGuildBoss_GuildSkillEffectLevelSignUis(ui:GetChild("Sign"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
