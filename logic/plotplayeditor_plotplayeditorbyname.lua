require("PlotPlayEditor_EditCompByName")
require("PlotPlayEditor_PartCompByName")
require("PlotPlayEditor_DialogEditByName")
require("PlotPlayEditor_SectionCompByName")
require("PlotPlayEditor_DialogCompByName")
require("PlotPlayEditor_ResourceChooseByName")

function GetPlotPlayEditor_PlotPlayEditorUis(ui)
  local uis = {}
  uis.EditComp = GetPlotPlayEditor_EditCompUis(ui:GetChild("EditComp"))
  uis.ChapterArea = GetPlotPlayEditor_PartCompUis(ui:GetChild("ChapterArea"))
  uis.JumpToFolderBtn = ui:GetChild("JumpToFolderBtn")
  uis.ExportLuaBtn = ui:GetChild("ExportLuaBtn")
  uis.DialogEdit = GetPlotPlayEditor_DialogEditUis(ui:GetChild("DialogEdit"))
  uis.SectionArea = GetPlotPlayEditor_SectionCompUis(ui:GetChild("SectionArea"))
  uis.DialogArea = GetPlotPlayEditor_DialogCompUis(ui:GetChild("DialogArea"))
  uis.ResourceChoose = GetPlotPlayEditor_ResourceChooseUis(ui:GetChild("ResourceChoose"))
  uis.SaveToExcelBtn = ui:GetChild("SaveToExcelBtn")
  uis.root = ui
  return uis
end
