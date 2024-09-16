require("CommonResource_SkillByName")

function GetCardPreview_CardSkillUis(ui)
  local uis = {}
  uis.Skill = GetCommonResource_SkillUis(ui:GetChild("Skill"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
