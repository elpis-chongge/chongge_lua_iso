function GetBadge_LevelUpItemUis(ui)
  local uis = {}
  
  uis.LevelUpItemBtn = ui:GetChild("LevelUpItemBtn")
  uis.LevelUpItemReduceBtn = ui:GetChild("LevelUpItemReduceBtn")
  uis.root = ui
  return uis
end
