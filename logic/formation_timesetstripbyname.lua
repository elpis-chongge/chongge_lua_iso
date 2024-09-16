function GetFormation_TimeSetStripUis(ui)
  local uis = {}
  
  uis.ScaleList = ui:GetChild("ScaleList")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.AddBtn = ui:GetChild("AddBtn")
  uis.ReduceBtn = ui:GetChild("ReduceBtn")
  uis.root = ui
  return uis
end
