function GetBattle_CardHeadOccupationUis(ui)
  local uis = {}
  
  uis.OccupationTxt = ui:GetChild("OccupationTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
