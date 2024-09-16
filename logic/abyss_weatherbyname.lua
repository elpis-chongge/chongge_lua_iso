function GetAbyss_WeatherUis(ui)
  local uis = {}
  
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.PlaceTxt = ui:GetChild("PlaceTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
