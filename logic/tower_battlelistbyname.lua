function GetTower_BattleListUis(ui)
  local uis = {}
  
  uis.Checkpoint1Btn = ui:GetChild("Checkpoint1Btn")
  uis.Checkpoint2Btn = ui:GetChild("Checkpoint2Btn")
  uis.Checkpoint3Btn = ui:GetChild("Checkpoint3Btn")
  uis.Checkpoint4Btn = ui:GetChild("Checkpoint4Btn")
  uis.Checkpoint5Btn = ui:GetChild("Checkpoint5Btn")
  uis.root = ui
  return uis
end
