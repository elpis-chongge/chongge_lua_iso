function GetFormation_PlayerHPUis(ui)
  local uis = {}
  
  uis.HpProgressBar = ui:GetChild("HpProgressBar")
  uis.HpMonsterProgressBar = ui:GetChild("HpMonsterProgressBar")
  uis.HpEliteProgressBar = ui:GetChild("HpEliteProgressBar")
  uis.HpBossProgressBar = ui:GetChild("HpBossProgressBar")
  uis.HpBuildProgressBar = ui:GetChild("HpBuildProgressBar")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.monsterCtr = ui:GetController("monster")
  uis.root = ui
  return uis
end
