require("Badge_FilterSortByName")

function GetBadge_FilterSortWindowUis(ui)
  local uis = {}
  uis.Main = GetBadge_FilterSortUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
