require("CommonResource_PopupBgByName")
require("Formation_BurstTipsRegionByName")

function GetFormation_BurstTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.BurstTips = GetFormation_BurstTipsRegionUis(ui:GetChild("BurstTips"))
  uis.root = ui
  return uis
end
