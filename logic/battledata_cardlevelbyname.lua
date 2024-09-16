function GetBattleData_CardLevelUis(ui)
  local uis = {}
  
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.ExpProgressBar = ui:GetChild("ExpProgressBar")
  uis.root = ui
  return uis
end
