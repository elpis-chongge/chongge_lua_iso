function GetFormation_CardBageSuit2Uis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SuitList = ui:GetChild("SuitList")
  uis.root = ui
  return uis
end
