require("CommonResource_PopupBgByName")
require("Formation_BuffTipsRegionByName")

function GetFormation_BuffTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.BuffTipsRegion = GetFormation_BuffTipsRegionUis(ui:GetChild("BuffTipsRegion"))
  uis.root = ui
  return uis
end
