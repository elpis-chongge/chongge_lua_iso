function GetCard_BreachSkillUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.LineImage = ui:GetChild("LineImage")
  uis.root = ui
  return uis
end
