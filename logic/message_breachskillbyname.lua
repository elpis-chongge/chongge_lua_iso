function GetMessage_BreachSkillUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.SkillTxt = ui:GetChild("SkillTxt")
  uis.root = ui
  return uis
end
