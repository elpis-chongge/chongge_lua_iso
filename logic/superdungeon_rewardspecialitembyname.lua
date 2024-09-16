function GetSuperDungeon_RewardSpecialItemUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.ItemList = ui:GetChild("ItemList")
  uis.TipsTxt = ui:GetChild("TipsTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
