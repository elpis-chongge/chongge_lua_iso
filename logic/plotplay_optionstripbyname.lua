require("PlotPlay_OptionByName")

function GetPlotPlay_OptionStripUis(ui)
  local uis = {}
  uis.Option = GetPlotPlay_OptionUis(ui:GetChild("Option"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
