function GetBattle_OutTipsUis(ui)
  local uis = {}
  
  uis.OutTips2Btn = ui:GetChild("OutTips2Btn")
  uis.OutTips1Btn = ui:GetChild("OutTips1Btn")
  uis.OutTips3Btn = ui:GetChild("OutTips3Btn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
