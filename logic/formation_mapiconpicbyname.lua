function GetFormation_MapIconPicUis(ui)
  local uis = {}
  
  uis.IconLoader = ui:GetChild("IconLoader")
  uis.lockCtr = ui:GetController("lock")
  uis.root = ui
  return uis
end
