function GetBattleData_BallteGuildBoss_TimeUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.Word1Txt = ui:GetChild("Word1Txt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
