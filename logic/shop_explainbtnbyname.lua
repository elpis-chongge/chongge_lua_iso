function GetShop_ExplainBtnUis(ui)
  local uis = {}
  
  uis.SpendTxt = ui:GetChild("SpendTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
