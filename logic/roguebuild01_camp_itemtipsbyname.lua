require("CommonResource_PopupBgByName")
require("RogueBuild01_Camp_ItemTipsRegionByName")

function GetRogueBuild01_Camp_ItemTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TipsRegion = GetRogueBuild01_Camp_ItemTipsRegionUis(ui:GetChild("TipsRegion"))
  uis.root = ui
  return uis
end
