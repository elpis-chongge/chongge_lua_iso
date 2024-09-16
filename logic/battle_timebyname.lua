function GetBattle_TimeUis(ui)
  local uis = {}
  
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.TimeNumTxt = ui:GetChild("TimeNumTxt")
  uis.root = ui
  return uis
end
