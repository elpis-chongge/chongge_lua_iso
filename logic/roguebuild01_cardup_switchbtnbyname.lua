function GetRogueBuild01_CardUp_SwitchBtnUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Word1Txt = ui:GetChild("Word1Txt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
