function GetStory_MainPlotPicUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.PicHolder = ui:GetChild("PicHolder")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
