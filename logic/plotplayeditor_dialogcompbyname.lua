function GetPlotPlayEditor_DialogCompUis(ui)
  local uis = {}
  
  uis.DialogList = ui:GetChild("DialogList")
  uis.AddDialogBtn = ui:GetChild("AddDialogBtn")
  uis.DelDialogBtn = ui:GetChild("DelDialogBtn")
  uis.CopyDialogBtn = ui:GetChild("CopyDialogBtn")
  uis.root = ui
  return uis
end
