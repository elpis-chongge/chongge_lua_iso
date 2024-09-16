require("Shop_ClothesDetailsByName")

function GetShop_ClothesDetailsWindowUis(ui)
  local uis = {}
  uis.Main = GetShop_ClothesDetailsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
