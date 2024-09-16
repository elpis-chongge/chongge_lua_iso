function GetCard_CardShowUis(ui)
  local uis = {}
  
  uis.CardShowLoader = ui:GetChild("CardShowLoader")
  uis.CardShowHolder = ui:GetChild("CardShowHolder")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
