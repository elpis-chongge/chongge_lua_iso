require("Explore_AFKExpProgressFillByName")

function GetExplore_AFKExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetExplore_AFKExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
