function GetBossDungeon_TitleUis(ui)
  local uis = {}
  
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
