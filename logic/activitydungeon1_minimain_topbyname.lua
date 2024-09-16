require("ActivityDungeon1_MiniMain_IntegralByName")
require("ActivityDungeon1_MiniMain_TodayIntegralByName")

function GetActivityDungeon1_MiniMain_TopUis(ui)
  local uis = {}
  uis.Integral = GetActivityDungeon1_MiniMain_IntegralUis(ui:GetChild("Integral"))
  uis.TodayIntegral = GetActivityDungeon1_MiniMain_TodayIntegralUis(ui:GetChild("TodayIntegral"))
  uis.root = ui
  return uis
end
