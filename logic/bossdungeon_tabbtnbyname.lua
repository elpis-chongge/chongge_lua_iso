function GetBossDungeon_TabBtnUis(ui)
  local uis = {}
  
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
