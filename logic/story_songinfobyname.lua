function GetStory_SongInfoUis(ui)
  local uis = {}
  
  uis.PlayBtn = ui:GetChild("PlayBtn")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.AuthorInfo1List = ui:GetChild("AuthorInfo1List")
  uis.AuthorInfo2List = ui:GetChild("AuthorInfo2List")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.LyricTxt = ui:GetChild("LyricTxt")
  uis.root = ui
  return uis
end
