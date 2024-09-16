require("CommonResource_PopupBgByName")
require("RogueBuild01_Camp_RebirthTipsRegionByName")

function GetRogueBuild01_Camp_RebirthTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TipsRegion = GetRogueBuild01_Camp_RebirthTipsRegionUis(ui:GetChild("TipsRegion"))
  uis.root = ui
  return uis
end
