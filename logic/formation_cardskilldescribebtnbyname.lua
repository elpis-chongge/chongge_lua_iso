require("CommonResource_SkillByName")
require("CommonResource_SkillDetailsTagByName")
require("CommonResource_SkillDetailsCDByName")
require("CommonResource_SkillLockByName")

function GetFormation_CardSkillDescribeBtnUis(ui)
  local uis = {}
  uis.Skill = GetCommonResource_SkillUis(ui:GetChild("Skill"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SkillDetailsTag = GetCommonResource_SkillDetailsTagUis(ui:GetChild("SkillDetailsTag"))
  uis.SkillDetailsCD = GetCommonResource_SkillDetailsCDUis(ui:GetChild("SkillDetailsCD"))
  uis.SkillLock = GetCommonResource_SkillLockUis(ui:GetChild("SkillLock"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
