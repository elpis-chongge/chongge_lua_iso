function GetEnergyObtain_EnergyItemUis(ui)
  local uis = {}
  
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.EnergyItemBtn = ui:GetChild("EnergyItemBtn")
  uis.CleanBtn = ui:GetChild("CleanBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
