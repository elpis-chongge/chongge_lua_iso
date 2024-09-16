function GetCard_SkillCDChoiceUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.Time20Btn = ui:GetChild("Time20Btn")
  uis.Time45Btn = ui:GetChild("Time45Btn")
  uis.Time70Btn = ui:GetChild("Time70Btn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
