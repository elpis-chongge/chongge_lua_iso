require("Shop_FirstRechargeItemFrameByName")
require("Shop_FirstRechargeCardFrameByName")

function GetShop_FirstRechargeAllFrameUis(ui)
  local uis = {}
  uis.ItemFrame = GetShop_FirstRechargeItemFrameUis(ui:GetChild("ItemFrame"))
  uis.CardFrame = GetShop_FirstRechargeCardFrameUis(ui:GetChild("CardFrame"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
