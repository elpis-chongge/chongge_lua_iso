require("Shop_OneYuanPass_ActivationByName")
require("Shop_OneYuanPass_WordByName")
require("Shop_OneYuanPass_ItemRegion1ByName")
require("Shop_OneYuanPass_ItemRegion2ByName")

function GetShop_OneYuanPassUis(ui)
  local uis = {}
  uis.Activation = GetShop_OneYuanPass_ActivationUis(ui:GetChild("Activation"))
  uis.Word = GetShop_OneYuanPass_WordUis(ui:GetChild("Word"))
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.BuyBtn = ui:GetChild("BuyBtn")
  uis.Item1 = GetShop_OneYuanPass_ItemRegion1Uis(ui:GetChild("Item1"))
  uis.Item2 = GetShop_OneYuanPass_ItemRegion1Uis(ui:GetChild("Item2"))
  uis.Item3 = GetShop_OneYuanPass_ItemRegion1Uis(ui:GetChild("Item3"))
  uis.Item4 = GetShop_OneYuanPass_ItemRegion1Uis(ui:GetChild("Item4"))
  uis.Item5 = GetShop_OneYuanPass_ItemRegion1Uis(ui:GetChild("Item5"))
  uis.Item6 = GetShop_OneYuanPass_ItemRegion1Uis(ui:GetChild("Item6"))
  uis.Item7 = GetShop_OneYuanPass_ItemRegion2Uis(ui:GetChild("Item7"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
