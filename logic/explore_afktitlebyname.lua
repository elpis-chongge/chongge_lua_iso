function GetExplore_AFKTitleUis(ui)
  local uis = {}
  
  uis.ExpProgressBar = ui:GetChild("ExpProgressBar")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.ExpTxt = ui:GetChild("ExpTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.ExpMaxTxt = ui:GetChild("ExpMaxTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
