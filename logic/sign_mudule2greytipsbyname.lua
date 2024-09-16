function GetSign_Mudule2GreyTipsUis(ui)
  local uis = {}
  
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.NumberDecTxt = ui:GetChild("NumberDecTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
