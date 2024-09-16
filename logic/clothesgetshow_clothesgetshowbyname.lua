require("CommonResource_BackGroundByName")
require("ClothesGetShow_CardShowByName")
require("ClothesGetShow_CardNameByName")

function GetClothesGetShow_ClothesGetShowUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.CardShow = GetClothesGetShow_CardShowUis(ui:GetChild("CardShow"))
  uis.CardName = GetClothesGetShow_CardNameUis(ui:GetChild("CardName"))
  uis.TipsList = ui:GetChild("TipsList")
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.GetEffectHolder = ui:GetChild("GetEffectHolder")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
