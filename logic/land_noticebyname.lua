function GetLand_NoticeUis(ui)
  local uis = {}
  
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.WordList = ui:GetChild("WordList")
  uis.root = ui
  return uis
end
