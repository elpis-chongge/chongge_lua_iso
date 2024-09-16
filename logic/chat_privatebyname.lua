function GetChat_PrivateUis(ui)
  local uis = {}
  
  uis.TargetBtn = ui:GetChild("TargetBtn")
  uis.DeletePrivateBtn = ui:GetChild("DeletePrivateBtn")
  uis.root = ui
  return uis
end
