require("Explore_AFKCountdownProgressFillByName")

function GetExplore_AFKCountdownProgressBarUis(ui)
  local uis = {}
  uis.bar = GetExplore_AFKCountdownProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
