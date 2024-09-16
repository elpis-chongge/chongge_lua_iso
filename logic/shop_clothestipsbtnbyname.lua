require("Shop_ClothesShowByName")
require("Shop_Clothes1NameByName")
require("Shop_ClothesTimeByName")
require("Shop_ColthesPriceByName")
require("Shop_NewByName")

function GetShop_ClothesTipsBtnUis(ui)
  local uis = {}
  uis.ClothesShow = GetShop_ClothesShowUis(ui:GetChild("ClothesShow"))
  uis.ClothesName = GetShop_Clothes1NameUis(ui:GetChild("ClothesName"))
  uis.ClothesTime = GetShop_ClothesTimeUis(ui:GetChild("ClothesTime"))
  uis.PriceLoader = GetShop_ColthesPriceUis(ui:GetChild("PriceLoader"))
  uis.SellOutTxt = ui:GetChild("SellOutTxt")
  uis.New = GetShop_NewUis(ui:GetChild("New"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
