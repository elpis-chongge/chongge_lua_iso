function GetStory_Info3Uis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
