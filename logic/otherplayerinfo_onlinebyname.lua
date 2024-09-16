function GetOtherPlayerInfo_OnLineUis(ui)
  local uis = {}
  
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
