function GetMessage_RewardShow1Uis(ui)
  local uis = {}
  
  uis.ItemList = ui:GetChild("ItemList")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
