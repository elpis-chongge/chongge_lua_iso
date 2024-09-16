function GetMessage_BtnGroupUis(ui)
  local uis = {}
  
  uis.Popup_B_Green_Btn = ui:GetChild("Popup_B_Green_Btn")
  uis.Popup_S_Black_Btn = ui:GetChild("Popup_S_Black_Btn")
  uis.Popup_S_Green_Btn = ui:GetChild("Popup_S_Green_Btn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
