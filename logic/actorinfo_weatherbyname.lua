function GetActorInfo_WeatherUis(ui)
  local uis = {}
  
  uis.AutoBtn = ui:GetChild("AutoBtn")
  uis.DayBtn = ui:GetChild("DayBtn")
  uis.DuskBtn = ui:GetChild("DuskBtn")
  uis.NightBtn = ui:GetChild("NightBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
