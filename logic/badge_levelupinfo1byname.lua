function GetBadge_LevelUpInfo1Uis(ui)
  local uis = {}
  
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.ExpTxt = ui:GetChild("ExpTxt")
  uis.ExpAddProgressBar = ui:GetChild("ExpAddProgressBar")
  uis.ExpProgressBar = ui:GetChild("ExpProgressBar")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
