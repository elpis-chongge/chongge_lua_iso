function GetBattleData_SufferDamageUis(ui)
  local uis = {}
  
  uis.SufferDamage2ProgressBar = ui:GetChild("SufferDamage2ProgressBar")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
