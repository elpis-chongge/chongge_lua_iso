function GetCommonResource_PlayerBuffUis(ui)
  local uis = {}
  
  uis.BuffLoader = ui:GetChild("BuffLoader")
  uis.BuffIconProgressBar = ui:GetChild("BuffIconProgressBar")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.root = ui
  return uis
end
