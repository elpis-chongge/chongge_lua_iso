require("Abyss_ExploreExpProgressFillByName")

function GetAbyss_ExploreExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetAbyss_ExploreExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
