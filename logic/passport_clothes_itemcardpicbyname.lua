function GetPassport_Clothes_ItemCardPicUis(ui)
  local uis = {}
  
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.buyCtr = ui:GetController("buy")
  uis.root = ui
  return uis
end
