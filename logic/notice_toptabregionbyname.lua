function GetNotice_TopTabRegionUis(ui)
  local uis = {}
  
  uis.TopTabList = ui:GetChild("TopTabList")
  uis.root = ui
  return uis
end
