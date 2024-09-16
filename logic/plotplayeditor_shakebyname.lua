function GetPlotPlayEditor_ShakeUis(ui)
  local uis = {}
  
  uis.ShakeCBox = ui:GetChild("ShakeCBox")
  uis.ShakeDelayTxt = ui:GetChild("ShakeDelayTxt")
  uis.ShakeTimeTxt = ui:GetChild("ShakeTimeTxt")
  uis.root = ui
  return uis
end
