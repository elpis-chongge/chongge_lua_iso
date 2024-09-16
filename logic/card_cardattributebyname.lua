function GetCard_CardAttributeUis(ui)
  local uis = {}
  
  uis.ENTxt = ui:GetChild("ENTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
