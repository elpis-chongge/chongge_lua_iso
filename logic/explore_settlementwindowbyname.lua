require("Explore_SettlementByName")

function GetExplore_SettlementWindowUis(ui)
  local uis = {}
  uis.Main = GetExplore_SettlementUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
