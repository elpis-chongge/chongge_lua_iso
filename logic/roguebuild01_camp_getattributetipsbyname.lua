require("CommonResource_PopupBgByName")
require("RogueBuild01_Camp_GetAttributeTipsRegionByName")

function GetRogueBuild01_Camp_GetAttributeTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TipsRegion = GetRogueBuild01_Camp_GetAttributeTipsRegionUis(ui:GetChild("TipsRegion"))
  uis.root = ui
  return uis
end
