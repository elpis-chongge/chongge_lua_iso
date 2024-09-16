require("PlotPlay_OsMaskByName")

function GetPlotPlay_CardUis(ui)
  local uis = {}
  uis.OsMask = GetPlotPlay_OsMaskUis(ui:GetChild("OsMask"))
  uis.root = ui
  return uis
end
