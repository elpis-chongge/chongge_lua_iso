function GetRogueBuild01_InsideMapBottomCardBtnUis(ui)
  local uis = {}
  
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
