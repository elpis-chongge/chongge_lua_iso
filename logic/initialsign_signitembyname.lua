function GetInitialSign_SignItemUis(ui)
  local uis = {}
  
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.root = ui
  return uis
end
