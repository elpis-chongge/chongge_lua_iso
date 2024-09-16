function GetGuildTrain_PlaceLatticeUis(ui)
  local uis = {}
  
  uis.PlaceEnableHolder = ui:GetChild("PlaceEnableHolder")
  uis.PlaceUnableHolder = ui:GetChild("PlaceUnableHolder")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
