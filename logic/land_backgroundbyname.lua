function GetLand_BackGroundUis(ui)
  local uis = {}
  
  uis.BackGroundLoader = ui:GetChild("BackGroundLoader")
  uis.BackGroundHolder = ui:GetChild("BackGroundHolder")
  uis.root = ui
  return uis
end
