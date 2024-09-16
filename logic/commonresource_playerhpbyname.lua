function GetCommonResource_PlayerHPUis(ui)
  local uis = {}
  
  uis.RageProgressBar = ui:GetChild("RageProgressBar")
  uis.HpProgressBar = ui:GetChild("HpProgressBar")
  uis.HpMonsterProgressBar = ui:GetChild("HpMonsterProgressBar")
  uis.HpEliteProgressBar = ui:GetChild("HpEliteProgressBar")
  uis.HpBossProgressBar = ui:GetChild("HpBossProgressBar")
  uis.HpBuildProgressBar = ui:GetChild("HpBuildProgressBar")
  uis.DefenseProgressBar = ui:GetChild("DefenseProgressBar")
  uis.DefenseTxt = ui:GetChild("DefenseTxt")
  uis.PercentageTxt = ui:GetChild("PercentageTxt")
  uis.RageTxt = ui:GetChild("RageTxt")
  uis.UIDTxt = ui:GetChild("UIDTxt")
  uis.BuffList = ui:GetChild("BuffList")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.monsterCtr = ui:GetController("monster")
  uis.root = ui
  return uis
end
