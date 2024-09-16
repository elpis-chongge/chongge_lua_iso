require("PlotPlay_ErectedHeadBgByName")

function GetPlotPlay_ErectedHeadUis(ui)
  local uis = {}
  uis.ErectedHeadBg = GetPlotPlay_ErectedHeadBgUis(ui:GetChild("ErectedHeadBg"))
  uis.root = ui
  return uis
end
