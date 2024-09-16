require("Expedition_ChoiceTabLockByName")

function GetExpedition_ChoiceTabBtnUis(ui)
  local uis = {}
  uis.n9 = GetExpedition_ChoiceTabLockUis(ui:GetChild("n9"))
  uis.NumbetTxt = ui:GetChild("NumbetTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
