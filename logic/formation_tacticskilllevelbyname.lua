function GetFormation_TacticSkillLevelUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.maxCtr = ui:GetController("max")
  uis.root = ui
  return uis
end
