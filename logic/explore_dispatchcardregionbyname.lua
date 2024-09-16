require("Explore_DispatchCardByName")

function GetExplore_DispatchCardRegionUis(ui)
  local uis = {}
  uis.CardList = ui:GetChild("CardList")
  uis.Card = GetExplore_DispatchCardUis(ui:GetChild("Card"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
