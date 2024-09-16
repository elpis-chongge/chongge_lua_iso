function GetFormation_BuffTipsDescribeUis(ui)
  local uis = {}
  
  uis.TipsTxt = ui:GetChild("TipsTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
