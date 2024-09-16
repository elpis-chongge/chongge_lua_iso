function GetActivityDungeon1002_NormalBtnUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.newCtr = ui:GetController("new")
  uis.root = ui
  return uis
end
