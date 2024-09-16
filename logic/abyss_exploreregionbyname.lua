require("Abyss_ExploreLevelByName")

function GetAbyss_ExploreRegionUis(ui)
  local uis = {}
  uis.ExploreLevel = GetAbyss_ExploreLevelUis(ui:GetChild("ExploreLevel"))
  uis.StateList = ui:GetChild("StateList")
  uis.GoBtn = ui:GetChild("GoBtn")
  uis.root = ui
  return uis
end
