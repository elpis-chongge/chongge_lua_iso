require("Shop_RecommendByName")
require("Shop_RechargeByName")
require("Shop_GiftByName")
require("Shop_ClothesByName")
require("Shop_TokenByName")
require("Shop_AssetsTipsGroupByName")

function GetShop_CollectionUis(ui)
  local uis = {}
  uis.Recommend = GetShop_RecommendUis(ui:GetChild("Recommend"))
  uis.Recharge = GetShop_RechargeUis(ui:GetChild("Recharge"))
  uis.Gift = GetShop_GiftUis(ui:GetChild("Gift"))
  uis.Clothes = GetShop_ClothesUis(ui:GetChild("Clothes"))
  uis.Token = GetShop_TokenUis(ui:GetChild("Token"))
  uis.AssetsTipsGroup = GetShop_AssetsTipsGroupUis(ui:GetChild("AssetsTipsGroup"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
