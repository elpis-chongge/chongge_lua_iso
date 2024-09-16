require("ActivityDungeon1002_Shop_TitleByName")

function GetActivityDungeon1002_Shop_ItemRegionUis(ui)
  local uis = {}
  uis.ShopTitle = GetActivityDungeon1002_Shop_TitleUis(ui:GetChild("ShopTitle"))
  uis.ItemList = ui:GetChild("ItemList")
  uis.root = ui
  return uis
end
