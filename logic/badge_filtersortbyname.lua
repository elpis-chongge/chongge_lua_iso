require("CommonResource_PopupBgByName")
require("Badge_FilterSortTipsByName")

function GetBadge_FilterSortUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.FilterSortTips = GetBadge_FilterSortTipsUis(ui:GetChild("FilterSortTips"))
  uis.root = ui
  return uis
end
