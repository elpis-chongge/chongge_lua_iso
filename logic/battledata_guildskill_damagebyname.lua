function GetBattleData_GuildSkill_DamageUis(ui)
  local uis = {}
  
  uis.DamageProgressBar = ui:GetChild("DamageProgressBar")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
