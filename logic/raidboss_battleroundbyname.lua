function GetRaidBoss_BattleRoundUis(ui)
  local uis = {}
  
  uis.RoundList = ui:GetChild("RoundList")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
