require("ActivityDungeon1001_Shop_SellOutByName")

function GetActivityDungeon1001_Shop_ItemUis(ui)
  local uis = {}
  uis.ItemBtn = ui:GetChild("ItemBtn")
  uis.SellOut = GetActivityDungeon1001_Shop_SellOutUis(ui:GetChild("SellOut"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
