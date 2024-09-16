function GetMessage_BadgeGetTipsWordUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Word1Txt = ui:GetChild("Word1Txt")
  uis.UseTxt = ui:GetChild("UseTxt")
  uis.root = ui
  return uis
end
