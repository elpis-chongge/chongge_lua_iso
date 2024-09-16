function GetMessage_DetailsModularUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.ItemList = ui:GetChild("ItemList")
  uis.Popup_S_Black_Btn = ui:GetChild("Popup_S_Black_Btn")
  uis.Popup_S_Green_Btn = ui:GetChild("Popup_S_Green_Btn")
  uis.Popup_B_Green_Btn = ui:GetChild("Popup_B_Green_Btn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
