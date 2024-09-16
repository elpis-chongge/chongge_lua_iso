function GetFormation_TacticSkillWearBtnUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.maxCtr = ui:GetController("max")
  uis.root = ui
  return uis
end
