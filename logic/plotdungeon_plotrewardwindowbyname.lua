require("PlotDungeon_PlotRewardByName")

function GetPlotDungeon_PlotRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetPlotDungeon_PlotRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
