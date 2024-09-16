function GetBattleData_BattleSkillTipsUis(ui)
  local uis = {}
  
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.UnitList = ui:GetChild("UnitList")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
