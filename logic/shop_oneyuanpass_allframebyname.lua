require("Shop_OneYuanPass_ItemFrameByName")
require("Shop_OneYuanPass_CardFrameByName")

function GetShop_OneYuanPass_AllFrameUis(ui)
  local uis = {}
  uis.ItemFrame = GetShop_OneYuanPass_ItemFrameUis(ui:GetChild("ItemFrame"))
  uis.CardFrame = GetShop_OneYuanPass_CardFrameUis(ui:GetChild("CardFrame"))
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
