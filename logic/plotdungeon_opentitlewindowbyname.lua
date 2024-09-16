require("PlotDungeon_OpenTitleByName")

function GetPlotDungeon_OpenTitleWindowUis(ui)
  local uis = {}
  uis.Main = GetPlotDungeon_OpenTitleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
