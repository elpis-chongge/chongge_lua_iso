require("CommonResource_PopupBgByName")
require("RogueBuild01_Buy_TipsRegionByName")

function GetRogueBuild01_ShopBuyUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TipsRegion = GetRogueBuild01_Buy_TipsRegionUis(ui:GetChild("TipsRegion"))
  uis.AssetsList = ui:GetChild("AssetsList")
  uis.root = ui
  return uis
end
