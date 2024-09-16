function GetShop_NotHaveCardUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.root = ui
  return uis
end
