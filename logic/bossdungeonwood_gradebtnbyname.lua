function GetBossDungeonWood_GradeBtnUis(ui)
  local uis = {}
  
  uis.GradeTxt = ui:GetChild("GradeTxt")
  uis.CardShowHolder = ui:GetChild("CardShowHolder")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.lockCtr = ui:GetController("lock")
  uis.root = ui
  return uis
end
