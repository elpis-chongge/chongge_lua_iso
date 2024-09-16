function GetBadge_ExchangeChoiceRegionUis(ui)
  local uis = {}
  
  uis.AllBtn = ui:GetChild("AllBtn")
  uis.Position1Btn = ui:GetChild("Position1Btn")
  uis.Position2Btn = ui:GetChild("Position2Btn")
  uis.Position3Btn = ui:GetChild("Position3Btn")
  uis.root = ui
  return uis
end
