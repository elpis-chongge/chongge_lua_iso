function GetAbyss_TabRegionUis(ui)
  local uis = {}
  
  uis.TabList = ui:GetChild("TabList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
