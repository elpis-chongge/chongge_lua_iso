require("BossDungeonWater_EnergyLabelByName")

function GetBossDungeonWater_ButtonRegionUis(ui)
  local uis = {}
  uis.EnergyLabel = GetBossDungeonWater_EnergyLabelUis(ui:GetChild("EnergyLabel"))
  uis.DispatchBtn = ui:GetChild("DispatchBtn")
  uis.Star1Btn = ui:GetChild("Star1Btn")
  uis.Star2Btn = ui:GetChild("Star2Btn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
