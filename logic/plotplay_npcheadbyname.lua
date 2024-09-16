require("PlotPlay_NpcHeadPicByName")

function GetPlotPlay_NpcHeadUis(ui)
  local uis = {}
  uis.NpcHeadLoader = GetPlotPlay_NpcHeadPicUis(ui:GetChild("NpcHeadLoader"))
  uis.root = ui
  return uis
end
