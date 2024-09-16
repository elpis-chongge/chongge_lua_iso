function GetRogueBuild01_ScoreRewardShowUis(ui)
  local uis = {}
  
  uis.ExpProgressBar = ui:GetChild("ExpProgressBar")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.ExpTxt = ui:GetChild("ExpTxt")
  uis.MaxTxt = ui:GetChild("MaxTxt")
  uis.TipsTxt = ui:GetChild("TipsTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
