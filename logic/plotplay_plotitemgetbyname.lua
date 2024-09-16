require("PlotPlay_PlotItemByName")

function GetPlotPlay_PlotItemGetUis(ui)
  local uis = {}
  uis.PlotItem = GetPlotPlay_PlotItemUis(ui:GetChild("PlotItem"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.root = ui
  return uis
end
