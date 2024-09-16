function GetPassport_WeekNumberUis(ui)
  local uis = {}
  
  uis.LimitTxt = ui:GetChild("LimitTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.root = ui
  return uis
end
