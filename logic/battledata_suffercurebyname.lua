function GetBattleData_SufferCureUis(ui)
  local uis = {}
  
  uis.SufferCure2ProgressBar = ui:GetChild("SufferCure2ProgressBar")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
