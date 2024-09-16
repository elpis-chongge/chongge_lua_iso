function GetAbyss_CollectionBtnUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.SellStateCtr = ui:GetController("SellState")
  uis.TypeCtr = ui:GetController("Type")
  uis.root = ui
  return uis
end
