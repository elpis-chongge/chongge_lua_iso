function GetCard_LevelUp4Uis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.LockTxt = ui:GetChild("LockTxt")
  uis.lockCtr = ui:GetController("lock")
  uis.root = ui
  return uis
end
