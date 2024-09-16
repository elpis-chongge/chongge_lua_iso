require("CommonResource_SkillByName")
require("CommonResource_SkillDetailsCDByName")
require("CommonResource_SkillDetailsTagByName")

function GetCardAttribute_DetailsSkillIconUis(ui)
  local uis = {}
  uis.Skill = GetCommonResource_SkillUis(ui:GetChild("Skill"))
  uis.SkillDetailsCD = GetCommonResource_SkillDetailsCDUis(ui:GetChild("SkillDetailsCD"))
  uis.SkillDetailsTag = GetCommonResource_SkillDetailsTagUis(ui:GetChild("SkillDetailsTag"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
