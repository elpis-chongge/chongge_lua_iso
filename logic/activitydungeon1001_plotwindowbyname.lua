require("ActivityDungeon1001_PlotByName")

function GetActivityDungeon1001_PlotWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1001_PlotUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
