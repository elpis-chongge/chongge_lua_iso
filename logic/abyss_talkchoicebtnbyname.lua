function GetAbyss_TalkChoiceBtnUis(ui)
  local uis = {}
  
  uis.TipsTxt = ui:GetChild("TipsTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
