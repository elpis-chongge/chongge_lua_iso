function GetBattle_BuffHitNumberUis(ui)
  local uis = {}
  
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.colorCtr = ui:GetController("color")
  uis.root = ui
  return uis
end
