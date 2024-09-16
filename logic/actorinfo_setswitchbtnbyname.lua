function GetActorInfo_SetSwitchBtnUis(ui)
  local uis = {}
  
  uis.CloseTxt = ui:GetChild("CloseTxt")
  uis.OpenTxt = ui:GetChild("OpenTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
