require("EnergyObtain_RecoveryTimeByName")

function GetEnergyObtain_EnergyMunberUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.RecoveryTime1 = GetEnergyObtain_RecoveryTimeUis(ui:GetChild("RecoveryTime1"))
  uis.RecoveryTime2 = GetEnergyObtain_RecoveryTimeUis(ui:GetChild("RecoveryTime2"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
