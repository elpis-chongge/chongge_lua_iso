require("CommonResource_BackGroundByName")
require("RogueBuild01_InsideMapBottomByName")
require("RogueBuild01_Shop_TimesByName")

function GetRogueBuild01_InsideShopUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.OutBtn = ui:GetChild("OutBtn")
  uis.Botton = GetRogueBuild01_InsideMapBottomUis(ui:GetChild("Botton"))
  uis.AssetsList = ui:GetChild("AssetsList")
  uis.ItemList = ui:GetChild("ItemList")
  uis.Times = GetRogueBuild01_Shop_TimesUis(ui:GetChild("Times"))
  uis.ResetBtn = ui:GetChild("ResetBtn")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
