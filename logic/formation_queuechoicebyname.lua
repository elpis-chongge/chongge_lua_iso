function GetFormation_QueueChoiceUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.TeamList = ui:GetChild("TeamList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
