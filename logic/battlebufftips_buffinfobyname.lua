function GetBattleBuffTips_BuffInfoUis(ui)
  local uis = {}
  
  uis.BuffLoader = ui:GetChild("BuffLoader")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
