require("Card_ClothesModularByName")
require("Card_CardQBByName")
require("Card_ClothesCardInfoByName")

function GetCard_CardClothesUis(ui)
  local uis = {}
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.ClothesModular = GetCard_ClothesModularUis(ui:GetChild("ClothesModular"))
  uis.CardQB = GetCard_CardQBUis(ui:GetChild("CardQB"))
  uis.CardInfo = GetCard_ClothesCardInfoUis(ui:GetChild("CardInfo"))
  uis.root = ui
  return uis
end
