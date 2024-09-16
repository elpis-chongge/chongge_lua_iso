function GetRogueBuild01_DungeonInfo_TitleUis(ui)
  local uis = {}
  
  uis.BattleTxt = ui:GetChild("BattleTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
