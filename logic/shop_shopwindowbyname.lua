require("Shop_ShopByName")

function GetShop_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetShop_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
