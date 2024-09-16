require("Explore_DispatchByName")

function GetExplore_DispatchWindowUis(ui)
  local uis = {}
  uis.Main = GetExplore_DispatchUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
