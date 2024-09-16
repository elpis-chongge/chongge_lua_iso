function GetBadge_SuitChoiceBtnUis(ui)
  local uis = {}
  
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
