function GetMessage_TokensPrice2_1Uis(ui)
  local uis = {}
  
  uis.Price1Txt = ui:GetChild("Price1Txt")
  uis.PriceLoader = ui:GetChild("PriceLoader")
  uis.PriceTxt = ui:GetChild("PriceTxt")
  uis.root = ui
  return uis
end
