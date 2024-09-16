function GetPassport_TaskExpUis(ui)
  local uis = {}
  
  uis.ItemPicLoader = ui:GetChild("ItemPicLoader")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.root = ui
  return uis
end
