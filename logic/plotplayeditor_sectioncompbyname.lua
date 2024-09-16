function GetPlotPlayEditor_SectionCompUis(ui)
  local uis = {}
  
  uis.SectionList = ui:GetChild("SectionList")
  uis.AddSectionBtn = ui:GetChild("AddSectionBtn")
  uis.DelSectionBtn = ui:GetChild("DelSectionBtn")
  uis.root = ui
  return uis
end
