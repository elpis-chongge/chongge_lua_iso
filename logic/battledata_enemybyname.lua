function GetBattleData_EnemyUis(ui)
  local uis = {}
  
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.DataLabel1Btn = ui:GetChild("DataLabel1Btn")
  uis.DataLabel2Btn = ui:GetChild("DataLabel2Btn")
  uis.DataLabel3Btn = ui:GetChild("DataLabel3Btn")
  uis.DataLabel4Btn = ui:GetChild("DataLabel4Btn")
  uis.EnemyCardList = ui:GetChild("EnemyCardList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
