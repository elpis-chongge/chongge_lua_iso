function GetExplore_AFKRewardItemUis(ui)
  local uis = {}
  
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
