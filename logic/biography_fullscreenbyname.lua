function GetBiography_FullScreenUis(ui)
  local uis = {}
  
  uis.SpineLoader = ui:GetChild("SpineLoader")
  uis.SpineHolder = ui:GetChild("SpineHolder")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.root = ui
  return uis
end
