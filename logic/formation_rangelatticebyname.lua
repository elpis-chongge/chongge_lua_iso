function GetFormation_RangeLatticeUis(ui)
  local uis = {}
  
  uis.RangeHolder = ui:GetChild("RangeHolder")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
