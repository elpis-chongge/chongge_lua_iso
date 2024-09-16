function GetFormation_OprTipsMapRegionUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.ContentList = ui:GetChild("ContentList")
  uis.NoBuffTxt = ui:GetChild("NoBuffTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
