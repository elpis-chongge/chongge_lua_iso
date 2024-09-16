function GetBattleData_MonsterSignUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
