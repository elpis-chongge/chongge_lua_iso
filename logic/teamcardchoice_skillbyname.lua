require("CommonResource_SkillByName")
require("TeamCardChoice_SkillCDInfoByName")
require("CommonResource_SkillDetailsTagByName")

function GetTeamCardChoice_SkillUis(ui)
  local uis = {}
  uis.BackImage = ui:GetChild("BackImage")
  uis.Skill = GetCommonResource_SkillUis(ui:GetChild("Skill"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.SkillCD = GetTeamCardChoice_SkillCDInfoUis(ui:GetChild("SkillCD"))
  uis.SkillDetailsTag = GetCommonResource_SkillDetailsTagUis(ui:GetChild("SkillDetailsTag"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
