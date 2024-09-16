require("PlotDungeon_OpenSceneByName")

function GetPlotDungeon_OpenSceneWindowUis(ui)
  local uis = {}
  uis.Main = GetPlotDungeon_OpenSceneUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
