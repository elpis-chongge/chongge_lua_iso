require("CommonResource_PopupBgByName")
require("Explore_DispatchTipsByName")

function GetExplore_DispatchUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.DispatchTips = GetExplore_DispatchTipsUis(ui:GetChild("DispatchTips"))
  uis.root = ui
  return uis
end
