function GetFormation_TargetLatticeUis(ui)
  local uis = {}
  
  uis.TargetHolder = ui:GetChild("TargetHolder")
  uis.WhiteTargetHolder = ui:GetChild("WhiteTargetHolder")
  uis.root = ui
  return uis
end
