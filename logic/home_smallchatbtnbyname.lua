function GetHome_SmallChatBtnUis(ui)
  local uis = {}
  
  uis.ChatWordTxt = ui:GetChild("ChatWordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
