function GetDungeonInfo_NumberLabel2Uis(ui)
  local uis = {}
  
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
