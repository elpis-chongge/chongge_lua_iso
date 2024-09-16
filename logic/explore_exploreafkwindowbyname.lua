require("Explore_ExploreAFKByName")

function GetExplore_ExploreAFKWindowUis(ui)
  local uis = {}
  uis.Main = GetExplore_ExploreAFKUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
