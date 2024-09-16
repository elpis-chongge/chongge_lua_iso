function GetMessage_SpendUis(ui)
  local uis = {}
  
  uis.IconLoader = ui:GetChild("IconLoader")
  uis.SpendTxt = ui:GetChild("SpendTxt")
  uis.root = ui
  return uis
end
