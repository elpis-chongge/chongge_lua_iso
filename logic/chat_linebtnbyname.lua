function GetChat_LineBtnUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.NumberProgressBar = ui:GetChild("NumberProgressBar")
  uis.c1Ctr = ui:GetController("c1")
  uis.ButtonCtr = ui:GetController("Button")
  uis.root = ui
  return uis
end
