function GetMessage_CardNameUis(ui)
  local uis = {}
  
  uis.Name1Txt = ui:GetChild("Name1Txt")
  uis.Name2Txt = ui:GetChild("Name2Txt")
  uis.root = ui
  return uis
end
