require("PlotDungeon_PlotDungeonByName")

function GetPlotDungeon_PlotDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetPlotDungeon_PlotDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
