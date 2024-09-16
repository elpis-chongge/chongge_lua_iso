function GetRaidBoss_QuickBattleNumberRegionUis(ui)
  local uis = {}
  
  uis.AddBtn = ui:GetChild("AddBtn")
  uis.ReduceBtn = ui:GetChild("ReduceBtn")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.root = ui
  return uis
end
