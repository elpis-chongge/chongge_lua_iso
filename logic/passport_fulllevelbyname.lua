function GetPassport_FullLevelUis(ui)
  local uis = {}
  
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
