function GetGuild_TrainBtnUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.bossCtr = ui:GetController("boss")
  uis.root = ui
  return uis
end
