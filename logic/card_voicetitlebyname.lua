function GetCard_VoiceTitleUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.LockTxt = ui:GetChild("LockTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
