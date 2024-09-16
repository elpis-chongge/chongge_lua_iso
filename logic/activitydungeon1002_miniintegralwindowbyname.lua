require("ActivityDungeon1002_MiniIntegralByName")

function GetActivityDungeon1002_MiniIntegralWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1002_MiniIntegralUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
