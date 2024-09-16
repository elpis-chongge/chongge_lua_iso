function GetPlayerInfo_PlotUis(ui)
  local uis = {}
  
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.root = ui
  return uis
end
