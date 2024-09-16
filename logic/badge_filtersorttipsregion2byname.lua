require("Badge_FilterSortTitle2ByName")

function GetBadge_FilterSortTipsRegion2Uis(ui)
  local uis = {}
  uis.FilterSortTitle = GetBadge_FilterSortTitle2Uis(ui:GetChild("FilterSortTitle"))
  uis.ChoiceList = ui:GetChild("ChoiceList")
  uis.root = ui
  return uis
end
