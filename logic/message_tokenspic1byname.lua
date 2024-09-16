function GetMessage_TokensPic1Uis(ui)
  local uis = {}
  
  uis.IconLoader = ui:GetChild("IconLoader")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
