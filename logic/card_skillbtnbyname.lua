require("CommonResource_SkillByName")
require("CommonResource_SkillDetailsCDByName")
require("CommonResource_SkillDetailsTag1ByName")
require("CommonResource_SkillLockByName")

function GetCard_SkillBtnUis(ui)
  local uis = {}
  uis.Skill = GetCommonResource_SkillUis(ui:GetChild("Skill"))
  uis.SkillDetailsCD = GetCommonResource_SkillDetailsCDUis(ui:GetChild("SkillDetailsCD"))
  uis.SkillDetailsTag = GetCommonResource_SkillDetailsTag1Uis(ui:GetChild("SkillDetailsTag"))
  uis.SkillLock = GetCommonResource_SkillLockUis(ui:GetChild("SkillLock"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
