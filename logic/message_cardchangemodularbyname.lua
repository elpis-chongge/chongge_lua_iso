function GetMessage_CardChangeModularUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.CardList = ui:GetChild("CardList")
  uis.root = ui
  return uis
end
