function GetMessage_ClothesDetailsModularUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Popup_S_Black_Btn = ui:GetChild("Popup_S_Black_Btn")
  uis.Popup_S_Green_Btn = ui:GetChild("Popup_S_Green_Btn")
  uis.ClothesNameTxt = ui:GetChild("ClothesNameTxt")
  uis.Name1Txt = ui:GetChild("Name1Txt")
  uis.Name2Txt = ui:GetChild("Name2Txt")
  uis.root = ui
  return uis
end
