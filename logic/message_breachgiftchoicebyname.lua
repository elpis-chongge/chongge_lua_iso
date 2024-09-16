function GetMessage_BreachGiftChoiceUis(ui)
  local uis = {}
  
  uis.ChoiceBtn = ui:GetChild("ChoiceBtn")
  uis.ItemList = ui:GetChild("ItemList")
  uis.root = ui
  return uis
end
