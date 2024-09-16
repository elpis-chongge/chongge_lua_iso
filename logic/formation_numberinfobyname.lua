function GetFormation_NumberInfoUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Number1Txt = ui:GetChild("Number1Txt")
  uis.Number2Txt = ui:GetChild("Number2Txt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
