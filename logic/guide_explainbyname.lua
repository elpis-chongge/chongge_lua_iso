function GetGuide_ExplainUis(ui)
  local uis = {}
  
  uis.ExplainLoader = ui:GetChild("ExplainLoader")
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.root = ui
  return uis
end
