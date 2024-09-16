require("Shop_SellOutByName")

function GetShop_GiftTipsUis(ui)
  local uis = {}
  uis.GiftTipsBtn = ui:GetChild("GiftTipsBtn")
  uis.SellOut = GetShop_SellOutUis(ui:GetChild("SellOut"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
