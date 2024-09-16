function GetRogueBuild01_CardUp_Info3AttributeUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.choiceCtr = ui:GetController("choice")
  uis.root = ui
  return uis
end
