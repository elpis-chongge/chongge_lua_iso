require("Adventure_PicMapByName")
require("Adventure_PlotTitleByName")

function GetAdventure_PlotDungeonMapUis(ui)
  local uis = {}
  uis.PicMap = GetAdventure_PicMapUis(ui:GetChild("PicMap"))
  uis.PlotTitle = GetAdventure_PlotTitleUis(ui:GetChild("PlotTitle"))
  uis.PlotStartBtn = ui:GetChild("PlotStartBtn")
  uis.root = ui
  return uis
end
