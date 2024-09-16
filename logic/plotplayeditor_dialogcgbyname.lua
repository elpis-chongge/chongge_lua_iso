function GetPlotPlayEditor_DialogCGUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.XTxt = ui:GetChild("XTxt")
  uis.YTxt = ui:GetChild("YTxt")
  uis.ScaleTxt = ui:GetChild("ScaleTxt")
  uis.root = ui
  return uis
end
