function GetAbyss_ExploreStateUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NothingTxt = ui:GetChild("NothingTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.LockTxt = ui:GetChild("LockTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
