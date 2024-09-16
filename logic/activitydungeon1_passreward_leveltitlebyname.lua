function GetActivityDungeon1_PassReward_LevelTitleUis(ui)
  local uis = {}
  
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
