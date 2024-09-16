require("CommonResource_BackGroundByName")
require("Bag_TabRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetBag_BagUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.ItemList = ui:GetChild("ItemList")
  uis.TabRegion = GetBag_TabRegionUis(ui:GetChild("TabRegion"))
  uis.BadgeDecomposeBtn = ui:GetChild("BadgeDecomposeBtn")
  uis.BadgeGoBtn = ui:GetChild("BadgeGoBtn")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
