function GetRogueBuild01_DetailsRegion2_Exp1Uis(ui)
  local uis = {}
  
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.ExpProgressBar = ui:GetChild("ExpProgressBar")
  uis.MaxTxt = ui:GetChild("MaxTxt")
  uis.TipsTxt = ui:GetChild("TipsTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
