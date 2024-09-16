require("ActivityDungeon1001_MiniIntegralByName")

function GetActivityDungeon1001_MiniIntegralWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1001_MiniIntegralUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
