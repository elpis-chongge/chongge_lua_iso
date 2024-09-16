function GetBattleData_FailTitleWordUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordFailTxt = ui:GetChild("WordFailTxt")
  uis.root = ui
  return uis
end
