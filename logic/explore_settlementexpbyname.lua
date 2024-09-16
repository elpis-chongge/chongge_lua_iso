function GetExplore_SettlementExpUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.ExpProgressBar = ui:GetChild("ExpProgressBar")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.ExpTxt = ui:GetChild("ExpTxt")
  uis.ExpMaxTxt = ui:GetChild("ExpMaxTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
