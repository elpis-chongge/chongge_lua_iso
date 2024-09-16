function GetLoading_EffectAniUis(ui)
  local uis = {}
  
  uis.EffectLoader = ui:GetChild("EffectLoader")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.root = ui
  return uis
end
