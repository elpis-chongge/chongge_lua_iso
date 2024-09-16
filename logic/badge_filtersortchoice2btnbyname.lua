function GetBadge_FilterSortChoice2BtnUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.OrderTxt = ui:GetChild("OrderTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
