require("Shop_ClothesPriceNumberByName")

function GetShop_ClothesPriceUis(ui)
  local uis = {}
  uis.Price = GetShop_ClothesPriceNumberUis(ui:GetChild("Price"))
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.root = ui
  return uis
end
