function GetAbyss_SmallMapPicUis(ui)
  local uis = {}
  
  uis.MapHolder = ui:GetChild("MapHolder")
  uis.MapLoader = ui:GetChild("MapLoader")
  uis.ShadeHolder = ui:GetChild("ShadeHolder")
  uis.root = ui
  return uis
end
