require("CommonResource_PopupBgByName")
require("RogueBuild01_Camp_RecoveryTipsRegionByName")

function GetRogueBuild01_Camp_RecoveryTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TipsRegion = GetRogueBuild01_Camp_RecoveryTipsRegionUis(ui:GetChild("TipsRegion"))
  uis.root = ui
  return uis
end
