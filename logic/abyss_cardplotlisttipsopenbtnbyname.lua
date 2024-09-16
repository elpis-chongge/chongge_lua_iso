function GetAbyss_CardPlotListTipsOpenBtnUis(ui)
  local uis = {}
  
  uis.ChapterTxt = ui:GetChild("ChapterTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
