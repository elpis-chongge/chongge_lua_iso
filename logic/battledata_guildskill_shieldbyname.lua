function GetBattleData_GuildSkill_ShieldUis(ui)
  local uis = {}
  
  uis.ShieldProgressBar = ui:GetChild("ShieldProgressBar")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
