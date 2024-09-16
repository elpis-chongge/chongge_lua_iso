function GetPlotPlayEditor_SectionEditUis(ui)
  local uis = {}
  
  uis.IdInputTxt = ui:GetChild("IdInputTxt")
  uis.AddBtn = ui:GetChild("AddBtn")
  uis.DelBtn = ui:GetChild("DelBtn")
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.LeftBtn = ui:GetChild("LeftBtn")
  uis.RightBtn = ui:GetChild("RightBtn")
  uis.DialogIdsInputTxt = ui:GetChild("DialogIdsInputTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
