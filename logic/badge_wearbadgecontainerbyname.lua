require("Badge_TabRegionByName")
require("Badge_ChoiceSortByName")

function GetBadge_WearBadgeContainerUis(ui)
  local uis = {}
  uis.TabRegion = GetBadge_TabRegionUis(ui:GetChild("TabRegion"))
  uis.BadgeList = ui:GetChild("BadgeList")
  uis.ChoiceBtn = ui:GetChild("ChoiceBtn")
  uis.ChoiceSort = GetBadge_ChoiceSortUis(ui:GetChild("ChoiceSort"))
  uis.root = ui
  return uis
end
