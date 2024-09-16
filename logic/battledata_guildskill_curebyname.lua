function GetBattleData_GuildSkill_CureUis(ui)
  local uis = {}
  
  uis.CureProgressBar = ui:GetChild("CureProgressBar")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
