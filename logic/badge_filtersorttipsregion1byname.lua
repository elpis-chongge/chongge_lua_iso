require("Badge_FilterSortTitle1ByName")

function GetBadge_FilterSortTipsRegion1Uis(ui)
  local uis = {}
  uis.FilterSortTitle = GetBadge_FilterSortTitle1Uis(ui:GetChild("FilterSortTitle"))
  uis.ChoiceList = ui:GetChild("ChoiceList")
  uis.root = ui
  return uis
end
