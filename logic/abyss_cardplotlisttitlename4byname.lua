function GetAbyss_CardPlotListTitleName4Uis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
