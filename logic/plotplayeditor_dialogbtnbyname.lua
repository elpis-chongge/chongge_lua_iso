function GetPlotPlayEditor_DialogBtnUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.AddBtn = ui:GetChild("AddBtn")
  uis.IdTxt = ui:GetChild("IdTxt")
  uis.IndexCBox = ui:GetChild("IndexCBox")
  uis.NextCBox = ui:GetChild("NextCBox")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
