function GetChat_LineTabUis(ui)
  local uis = {}
  
  uis.LineList = ui:GetChild("LineList")
  uis.root = ui
  return uis
end
