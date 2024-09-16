require("CommonResource_PopupBgByName")
require("RogueBuild01_SweepTipsByName")

function GetRogueBuild01_SweepUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.SweepTips = GetRogueBuild01_SweepTipsUis(ui:GetChild("SweepTips"))
  uis.root = ui
  return uis
end
