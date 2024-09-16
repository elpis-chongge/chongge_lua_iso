require("ActivityDungeon1_PlotByName")

function GetActivityDungeon1_PlotWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1_PlotUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
