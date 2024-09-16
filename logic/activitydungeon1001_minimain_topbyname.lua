require("ActivityDungeon1001_MiniMain_IntegralByName")

function GetActivityDungeon1001_MiniMain_TopUis(ui)
  local uis = {}
  uis.Integral = GetActivityDungeon1001_MiniMain_IntegralUis(ui:GetChild("Integral"))
  uis.root = ui
  return uis
end
