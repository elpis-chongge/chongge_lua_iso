require("GuildBoss_GuildSkillEffectRegionByName")
require("GuildBoss_ProgrammeSkillRegionByName")
require("GuildBoss_ProgrammeSkillLevelByName")
require("GuildBoss_ProgrammeSkillLockByName")

function GetGuildBoss_GuildSkillProgrammeUis(ui)
  local uis = {}
  uis.EffectRegion = GetGuildBoss_GuildSkillEffectRegionUis(ui:GetChild("EffectRegion"))
  uis.ProgrammeList = ui:GetChild("ProgrammeList")
  uis.SkillRegion = GetGuildBoss_ProgrammeSkillRegionUis(ui:GetChild("SkillRegion"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Level = GetGuildBoss_ProgrammeSkillLevelUis(ui:GetChild("Level"))
  uis.LookBtn = ui:GetChild("LookBtn")
  uis.NumberList = ui:GetChild("NumberList")
  uis.WordList = ui:GetChild("WordList")
  uis.WearBtn = ui:GetChild("WearBtn")
  uis.UpBtn = ui:GetChild("UpBtn")
  uis.Lock = GetGuildBoss_ProgrammeSkillLockUis(ui:GetChild("Lock"))
  uis.lcokCtr = ui:GetController("lcok")
  uis.maxCtr = ui:GetController("max")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
