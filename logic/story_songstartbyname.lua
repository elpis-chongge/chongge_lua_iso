function GetStory_SongStartUis(ui)
  local uis = {}
  
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
