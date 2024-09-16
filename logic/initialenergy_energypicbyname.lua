function GetInitialEnergy_EnergyPicUis(ui)
  local uis = {}
  
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.root = ui
  return uis
end
