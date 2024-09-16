require("PlotPlay_CardShowByName")

function GetPlotPlay_ErectedHeadBgUis(ui)
  local uis = {}
  uis.CardShow = GetPlotPlay_CardShowUis(ui:GetChild("CardShow"))
  uis.root = ui
  return uis
end
