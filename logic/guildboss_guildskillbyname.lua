require("CommonResource_BackGroundByName")
require("GuildBoss_GuildSkillWordByName")
require("GuildBoss_GuildSkillModuleRegionByName")
require("GuildBoss_GuildSkillProgrammeByName")

function GetGuildBoss_GuildSkillUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Word = GetGuildBoss_GuildSkillWordUis(ui:GetChild("Word"))
  uis.ModuleRegion = GetGuildBoss_GuildSkillModuleRegionUis(ui:GetChild("ModuleRegion"))
  uis.SkillProgramme = GetGuildBoss_GuildSkillProgrammeUis(ui:GetChild("SkillProgramme"))
  uis.EditBtn = ui:GetChild("EditBtn")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.FunctionDetailsBtn = ui:GetChild("FunctionDetailsBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
