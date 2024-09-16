function GetPlayerInfo_TitleUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.HideBtn = ui:GetChild("HideBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
