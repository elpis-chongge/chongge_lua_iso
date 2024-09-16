require("ActivityDungeon1002_MiniMain_IntegralByName")

function GetActivityDungeon1002_MiniMain_TopUis(ui)
  local uis = {}
  uis.Integral = GetActivityDungeon1002_MiniMain_IntegralUis(ui:GetChild("Integral"))
  uis.root = ui
  return uis
end
