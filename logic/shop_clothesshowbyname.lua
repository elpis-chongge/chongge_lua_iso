function GetShop_ClothesShowUis(ui)
  local uis = {}
  
  uis.ClothesShowLoader = ui:GetChild("ClothesShowLoader")
  uis.ClothesShowHolder = ui:GetChild("ClothesShowHolder")
  uis.root = ui
  return uis
end
