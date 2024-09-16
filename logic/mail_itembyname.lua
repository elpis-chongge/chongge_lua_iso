function GetMail_ItemUis(ui)
  local uis = {}
  
  uis.ItemList = ui:GetChild("ItemList")
  uis.root = ui
  return uis
end
