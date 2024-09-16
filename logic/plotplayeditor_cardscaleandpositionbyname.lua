function GetPlotPlayEditor_CardScaleAndPositionUis(ui)
  local uis = {}
  
  uis.PosXTxt = ui:GetChild("PosXTxt")
  uis.PosYTxt = ui:GetChild("PosYTxt")
  uis.ScaleTxt = ui:GetChild("ScaleTxt")
  uis.root = ui
  return uis
end
