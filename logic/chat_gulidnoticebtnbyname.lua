function GetChat_GulidNoticeBtnUis(ui)
  local uis = {}
  
  uis.TipsTxt = ui:GetChild("TipsTxt")
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
