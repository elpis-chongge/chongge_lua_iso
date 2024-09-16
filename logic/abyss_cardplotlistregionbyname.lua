function GetAbyss_CardPlotListRegionUis(ui)
  local uis = {}
  
  uis.TypeList = ui:GetChild("TypeList")
  uis.CardAList = ui:GetChild("CardAList")
  uis.CardBList = ui:GetChild("CardBList")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
