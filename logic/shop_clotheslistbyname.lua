require("Shop_ClothesNameByName")
require("Shop_WearingByName")
require("Shop_ClothesPriceByName")
require("Shop_NotHaveCardByName")

function GetShop_ClothesListUis(ui)
  local uis = {}
  uis.ClothesName = GetShop_ClothesNameUis(ui:GetChild("ClothesName"))
  uis.Wearing = GetShop_WearingUis(ui:GetChild("Wearing"))
  uis.ClothesPrice = GetShop_ClothesPriceUis(ui:GetChild("ClothesPrice"))
  uis.WearBtn = ui:GetChild("WearBtn")
  uis.NotHaveCard = GetShop_NotHaveCardUis(ui:GetChild("NotHaveCard"))
  uis.TipsList = ui:GetChild("TipsList")
  uis.leftCtr = ui:GetController("left")
  uis.rightCtr = ui:GetController("right")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
