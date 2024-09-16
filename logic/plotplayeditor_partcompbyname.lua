function GetPlotPlayEditor_PartCompUis(ui)
  local uis = {}
  
  uis.ChapterList = ui:GetChild("ChapterList")
  uis.AddChapterBtn = ui:GetChild("AddChapterBtn")
  uis.root = ui
  return uis
end
