function GetGuildBoss_CompensateLineupUis(ui)
  local uis = {}
  
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.HeadList = ui:GetChild("HeadList")
  uis.BattleBtn = ui:GetChild("BattleBtn")
  uis.root = ui
  return uis
end
