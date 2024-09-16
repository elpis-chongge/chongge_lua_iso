require("Formation_RoundStripCardByName")

function GetFormation_RoundStripUis(ui)
  local uis = {}
  uis.AddBtn = ui:GetChild("AddBtn")
  uis.StripCard = GetFormation_RoundStripCardUis(ui:GetChild("StripCard"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
