function GetNotice_LeftTabRegionUis(ui)
  local uis = {}
  
  uis.LeftTabList = ui:GetChild("LeftTabList")
  uis.root = ui
  return uis
end
