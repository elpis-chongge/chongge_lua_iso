function GetChat_ShieldOnLineUis(ui)
  local uis = {}
  
  uis.OnLineTxt = ui:GetChild("OnLineTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
