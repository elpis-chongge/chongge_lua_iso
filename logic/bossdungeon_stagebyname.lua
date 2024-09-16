function GetBossDungeon_StageUis(ui)
  local uis = {}
  
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
