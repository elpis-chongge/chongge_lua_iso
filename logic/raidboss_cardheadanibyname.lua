function GetRaidBoss_CardHeadAniUis(ui)
  local uis = {}
  
  uis.CardHeadBtn = ui:GetChild("CardHeadBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
