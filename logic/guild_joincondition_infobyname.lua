function GetGuild_JoinCondition_infoUis(ui)
  local uis = {}
  
  uis.Condition1Btn = ui:GetChild("Condition1Btn")
  uis.Condition2Btn = ui:GetChild("Condition2Btn")
  uis.Condition3Btn = ui:GetChild("Condition3Btn")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
