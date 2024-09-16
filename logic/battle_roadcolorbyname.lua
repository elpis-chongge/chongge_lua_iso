function GetBattle_RoadColorUis(ui)
  local uis = {}
  
  uis.Word1Txt = ui:GetChild("Word1Txt")
  uis.Word2Txt = ui:GetChild("Word2Txt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
