function GetAbyss_TotalPriceStripUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.PriceList = ui:GetChild("PriceList")
  uis.root = ui
  return uis
end
