require("CommonResource_BackGroundByName")
require("Shop_CollectionByName")
require("Shop_TabRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetShop_ShopUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Collection = GetShop_CollectionUis(ui:GetChild("Collection"))
  uis.TabRegion = GetShop_TabRegionUis(ui:GetChild("TabRegion"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
