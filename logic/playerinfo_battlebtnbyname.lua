function GetPlayerInfo_BattleBtnUis(ui)
  local uis = {}
  
  uis.Name1Txt = ui:GetChild("Name1Txt")
  uis.Number1Txt = ui:GetChild("Number1Txt")
  uis.Name2Txt = ui:GetChild("Name2Txt")
  uis.Number2Txt = ui:GetChild("Number2Txt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
