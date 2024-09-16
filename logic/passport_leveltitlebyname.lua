function GetPassport_LevelTitleUis(ui)
  local uis = {}
  
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.LevelWordTxt = ui:GetChild("LevelWordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
