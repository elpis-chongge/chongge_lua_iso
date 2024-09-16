function GetFriend_SearchUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.SearchBtn = ui:GetChild("SearchBtn")
  uis.root = ui
  return uis
end
