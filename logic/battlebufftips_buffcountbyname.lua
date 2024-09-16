function GetBattleBuffTips_BuffCountUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.BuffTxt = ui:GetChild("BuffTxt")
  uis.DeBuffTxt = ui:GetChild("DeBuffTxt")
  uis.root = ui
  return uis
end
