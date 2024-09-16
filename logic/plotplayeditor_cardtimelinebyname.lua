function GetPlotPlayEditor_CardTimelineUis(ui)
  local uis = {}
  
  uis.CreateBtn = ui:GetChild("CreateBtn")
  uis.LookBtn = ui:GetChild("LookBtn")
  uis.PathTxt = ui:GetChild("PathTxt")
  uis.DelBtn = ui:GetChild("DelBtn")
  uis.AddBtn = ui:GetChild("AddBtn")
  uis.SaveBtn = ui:GetChild("SaveBtn")
  uis.EditTemplateBtn = ui:GetChild("EditTemplateBtn")
  uis.ActionTypeCBox = ui:GetChild("ActionTypeCBox")
  uis.TemplateList = ui:GetChild("TemplateList")
  uis.AddTemplateBtn = ui:GetChild("AddTemplateBtn")
  uis.DelTemplateBtn = ui:GetChild("DelTemplateBtn")
  uis.SaveTemplateBtn = ui:GetChild("SaveTemplateBtn")
  uis.JumpBtn = ui:GetChild("JumpBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
