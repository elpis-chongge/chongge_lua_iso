function GetExplore_AFKTimeChoiceBtnUis(ui)
  local uis = {}
  
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
