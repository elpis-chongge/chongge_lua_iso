function GetExpedition_ArrangeTips3Uis(ui)
  local uis = {}
  
  uis.WaveTxt = ui:GetChild("WaveTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.CardList = ui:GetChild("CardList")
  uis.root = ui
  return uis
end
