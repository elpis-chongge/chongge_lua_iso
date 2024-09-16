function GetMessage_ItemNumberStripRegionUis(ui)
  local uis = {}
  
  uis.Price1Txt = ui:GetChild("Price1Txt")
  uis.PriceTxt = ui:GetChild("PriceTxt")
  uis.PriceLoader = ui:GetChild("PriceLoader")
  uis.root = ui
  return uis
end
