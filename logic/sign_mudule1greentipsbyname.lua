function GetSign_Mudule1GreenTipsUis(ui)
  local uis = {}
  
  uis.NumberDecTxt = ui:GetChild("NumberDecTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
