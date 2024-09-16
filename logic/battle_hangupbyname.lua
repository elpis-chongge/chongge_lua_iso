function GetBattle_HangUpUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.OutTxt = ui:GetChild("OutTxt")
  uis.root = ui
  return uis
end
