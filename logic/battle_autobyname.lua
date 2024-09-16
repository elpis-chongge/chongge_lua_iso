function GetBattle_AutoUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.DotTxt = ui:GetChild("DotTxt")
  uis.root = ui
  return uis
end
