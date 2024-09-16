function GetMessage_TokensPrice2_2Uis(ui)
  local uis = {}
  
  uis.Price1Txt = ui:GetChild("Price1Txt")
  uis.PriceLoader = ui:GetChild("PriceLoader")
  uis.PriceTxt = ui:GetChild("PriceTxt")
  uis.OriginalPriceTxt = ui:GetChild("OriginalPriceTxt")
  uis.root = ui
  return uis
end
