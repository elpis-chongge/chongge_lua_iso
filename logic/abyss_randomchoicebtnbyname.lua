function GetAbyss_RandomChoiceBtnUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.BattleTxt = ui:GetChild("BattleTxt")
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.ItemTxt = ui:GetChild("ItemTxt")
  uis.ItemWordTxt = ui:GetChild("ItemWordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
