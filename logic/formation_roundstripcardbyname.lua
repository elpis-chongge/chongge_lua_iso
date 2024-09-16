require("Formation_SetChoiceTimeByName")

function GetFormation_RoundStripCardUis(ui)
  local uis = {}
  uis.SetChoiceTime = GetFormation_SetChoiceTimeUis(ui:GetChild("SetChoiceTime"))
  uis.HeadList = ui:GetChild("HeadList")
  uis.RoundTxt = ui:GetChild("RoundTxt")
  uis.DeleteBtn = ui:GetChild("DeleteBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
