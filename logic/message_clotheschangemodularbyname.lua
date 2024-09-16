function GetMessage_ClothesChangeModularUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.ClothesList = ui:GetChild("ClothesList")
  uis.root = ui
  return uis
end
