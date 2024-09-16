require("ActivityDungeon1002_PlotByName")

function GetActivityDungeon1002_PlotWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1002_PlotUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
