function GetBattleData_TitleWordUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordWinTxt = ui:GetChild("WordWinTxt")
  uis.WordFailTxt = ui:GetChild("WordFailTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
