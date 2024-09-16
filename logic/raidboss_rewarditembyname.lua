function GetRaidBoss_RewardItemUis(ui)
  local uis = {}
  
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
