require("Clothes_ClothesDetailsByName")

function GetClothes_ClothesDetailsWindowUis(ui)
  local uis = {}
  uis.Main = GetClothes_ClothesDetailsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
