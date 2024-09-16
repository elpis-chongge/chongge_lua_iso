require("Shop_TokenSellOutByName")

function GetShop_TokenTipsUis(ui)
  local uis = {}
  uis.TokenTipsBtn = ui:GetChild("TokenTipsBtn")
  uis.SellOut = GetShop_TokenSellOutUis(ui:GetChild("SellOut"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
