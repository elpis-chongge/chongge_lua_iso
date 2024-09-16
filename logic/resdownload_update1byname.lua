function GetResDownload_Update1Uis(ui)
  local uis = {}
  
  uis.PopupCloseBtn = ui:GetChild("PopupCloseBtn")
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.CancelBtn = ui:GetChild("CancelBtn")
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.root = ui
  return uis
end
