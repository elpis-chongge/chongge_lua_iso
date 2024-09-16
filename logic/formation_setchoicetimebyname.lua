require("Formation_SetChoiceTimeBgByName")

function GetFormation_SetChoiceTimeUis(ui)
  local uis = {}
  uis.n6 = GetFormation_SetChoiceTimeBgUis(ui:GetChild("n6"))
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
