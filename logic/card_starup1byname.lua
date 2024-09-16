function GetCard_StarUp1Uis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.StarList = ui:GetChild("StarList")
  uis.SkillList = ui:GetChild("SkillList")
  uis.SkillAllLookBtn = ui:GetChild("SkillAllLookBtn")
  uis.root = ui
  return uis
end
