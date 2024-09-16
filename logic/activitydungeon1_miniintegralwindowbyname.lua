require("ActivityDungeon1_MiniIntegralByName")

function GetActivityDungeon1_MiniIntegralWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1_MiniIntegralUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
