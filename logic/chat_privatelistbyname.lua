function GetChat_PrivateListUis(ui)
  local uis = {}
  
  uis.PrivateReturnBtn = ui:GetChild("PrivateReturnBtn")
  uis.PrivateList = ui:GetChild("PrivateList")
  uis.AddBtn = ui:GetChild("AddBtn")
  uis.root = ui
  return uis
end
