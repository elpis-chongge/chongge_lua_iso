require("ClothesGetShow_ClothesGetShowByName")

function GetClothesGetShow_ClothesGetShowWindowUis(ui)
  local uis = {}
  uis.Main = GetClothesGetShow_ClothesGetShowUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
