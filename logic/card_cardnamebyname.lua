function GetCard_CardNameUis(ui)
  local uis = {}
  
  uis.CardNameTxt = ui:GetChild("CardNameTxt")
  uis.CardNameENTxt = ui:GetChild("CardNameENTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.SignatureTxt = ui:GetChild("SignatureTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
