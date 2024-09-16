function GetMessage_OpalExchange1Uis(ui)
  local uis = {}
  
  uis.Pic1Loader = ui:GetChild("Pic1Loader")
  uis.Pic2Loader = ui:GetChild("Pic2Loader")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
