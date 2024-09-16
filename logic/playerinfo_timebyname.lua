function GetPlayerInfo_TimeUis(ui)
  local uis = {}
  
  uis.DayTxt = ui:GetChild("DayTxt")
  uis.RegisterTxt = ui:GetChild("RegisterTxt")
  uis.RegisterTimeTxt = ui:GetChild("RegisterTimeTxt")
  uis.root = ui
  return uis
end
