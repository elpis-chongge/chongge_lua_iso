function GetStory_ItemInfoWordUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.ItemUseBtn = ui:GetChild("ItemUseBtn")
  uis.root = ui
  return uis
end
