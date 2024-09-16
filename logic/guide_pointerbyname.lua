function GetGuide_PointerUis(ui)
  local uis = {}
  
  uis.PointerLoader = ui:GetChild("PointerLoader")
  uis.PointerHolder = ui:GetChild("PointerHolder")
  uis.root = ui
  return uis
end
