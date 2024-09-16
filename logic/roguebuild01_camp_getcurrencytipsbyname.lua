require("CommonResource_PopupBgByName")
require("RogueBuild01_Camp_GetCurrencyTipsRegionByName")

function GetRogueBuild01_Camp_GetCurrencyTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TipsRegion = GetRogueBuild01_Camp_GetCurrencyTipsRegionUis(ui:GetChild("TipsRegion"))
  uis.root = ui
  return uis
end
