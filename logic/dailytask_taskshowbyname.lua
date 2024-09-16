function GetDailyTask_TaskShowUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.LookBtn = ui:GetChild("LookBtn")
  uis.root = ui
  return uis
end
