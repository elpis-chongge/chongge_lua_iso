function GetMessage_CardListUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.CardList = ui:GetChild("CardList")
  uis.root = ui
  return uis
end
