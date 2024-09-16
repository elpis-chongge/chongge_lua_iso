function GetShop_ColthesPriceUis(ui)
  local uis = {}
  
  uis.PriceLoader = ui:GetChild("PriceLoader")
  uis.PriceTxt = ui:GetChild("PriceTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
