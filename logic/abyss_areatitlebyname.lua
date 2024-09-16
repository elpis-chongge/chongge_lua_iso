function GetAbyss_AreaTitleUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.lockCtr = ui:GetController("lock")
  uis.root = ui
  return uis
end
