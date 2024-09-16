function GetInitialCarnival_PositionBtnUis(ui)
  local uis = {}
  
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.ProgressTxt = ui:GetChild("ProgressTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
