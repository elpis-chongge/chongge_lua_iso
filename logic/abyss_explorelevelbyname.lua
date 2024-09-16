function GetAbyss_ExploreLevelUis(ui)
  local uis = {}
  
  uis.ExpProgressBar = ui:GetChild("ExpProgressBar")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.ExpTxt = ui:GetChild("ExpTxt")
  uis.ExpMaxTxt = ui:GetChild("ExpMaxTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
