function GetFormation_TacticSkillGoBtnUis(ui)
  local uis = {}
  
  uis.SkillList = ui:GetChild("SkillList")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
