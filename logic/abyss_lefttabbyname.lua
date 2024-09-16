function GetAbyss_LeftTabUis(ui)
  local uis = {}
  
  uis.ProgressTxt = ui:GetChild("ProgressTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.LeftTabList = ui:GetChild("LeftTabList")
  uis.root = ui
  return uis
end
