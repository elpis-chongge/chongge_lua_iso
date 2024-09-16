function GetCommonResource_CardBreachUis(ui)
  local uis = {}
  
  uis.BreachHolder = ui:GetChild("BreachHolder")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
