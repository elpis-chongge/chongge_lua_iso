function GetPlotDungeon_RightRegionUis(ui)
  local uis = {}
  
  uis.RightBtn = ui:GetChild("RightBtn")
  uis.RightUnknownBtn = ui:GetChild("RightUnknownBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
