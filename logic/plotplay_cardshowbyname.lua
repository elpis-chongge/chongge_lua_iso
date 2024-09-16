function GetPlotPlay_CardShowUis(ui)
  local uis = {}
  
  uis.CardLoader = ui:GetChild("CardLoader")
  uis.CardHolder = ui:GetChild("CardHolder")
  uis.root = ui
  return uis
end
