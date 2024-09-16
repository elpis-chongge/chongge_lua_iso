require("PlotPlayEditor_PlotPlayEditorByName")

function GetPlotPlayEditor_PlotPlayEditorWindowUis(ui)
  local uis = {}
  uis.Main = GetPlotPlayEditor_PlotPlayEditorUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
