function GetMessage_MapContentUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.InfoList = ui:GetChild("InfoList")
  uis.root = ui
  return uis
end
