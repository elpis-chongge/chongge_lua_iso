function GetCard_SkillUpSuccess1Uis(ui)
  local uis = {}
  
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.root = ui
  return uis
end
