require("Explore_ExploreByName")

function GetExplore_ExploreWindowUis(ui)
  local uis = {}
  uis.Main = GetExplore_ExploreUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
