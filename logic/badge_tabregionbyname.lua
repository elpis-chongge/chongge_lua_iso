function GetBadge_TabRegionUis(ui)
  local uis = {}
  
  uis.Tab1Btn = ui:GetChild("Tab1Btn")
  uis.Tab2Btn = ui:GetChild("Tab2Btn")
  uis.Tab3Btn = ui:GetChild("Tab3Btn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
