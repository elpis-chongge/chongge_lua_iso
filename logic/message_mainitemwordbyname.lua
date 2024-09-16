function GetMessage_MainItemWordUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.UseTxt = ui:GetChild("UseTxt")
  uis.root = ui
  return uis
end
