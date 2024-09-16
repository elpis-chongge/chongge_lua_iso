function GetBattle_BurstBlockHitNumberUis(ui)
  local uis = {}
  
  uis.StateLoader = ui:GetChild("StateLoader")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.colorCtr = ui:GetController("color")
  uis.root = ui
  return uis
end
