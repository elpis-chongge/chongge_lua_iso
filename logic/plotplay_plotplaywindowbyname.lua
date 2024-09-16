require("PlotPlay_PlotPlayByName")

function GetPlotPlay_PlotPlayWindowUis(ui)
  local uis = {}
  uis.Main = GetPlotPlay_PlotPlayUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
