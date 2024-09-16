require("Formation_SetChoiceCardByName")
require("Formation_SetSelectedByName")

function GetFormation_SetChoiceCardBtnUis(ui)
  local uis = {}
  uis.CardHead = GetFormation_SetChoiceCardUis(ui:GetChild("CardHead"))
  uis.SetSelected = GetFormation_SetSelectedUis(ui:GetChild("SetSelected"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
