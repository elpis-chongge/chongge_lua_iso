function GetCard_EffectBreachUis(ui)
  local uis = {}
  
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.root = ui
  return uis
end
