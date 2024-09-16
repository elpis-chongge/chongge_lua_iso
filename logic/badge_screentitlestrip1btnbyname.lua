function GetBadge_ScreenTitleStrip1BtnUis(ui)
  local uis = {}
  
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
