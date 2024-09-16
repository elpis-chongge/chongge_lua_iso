function GetExplore_AFKTeamSwitchBtnUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.NothingTxt = ui:GetChild("NothingTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.LockTxt = ui:GetChild("LockTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
