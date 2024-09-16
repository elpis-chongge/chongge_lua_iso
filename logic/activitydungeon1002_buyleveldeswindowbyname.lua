require("ActivityDungeon1002_BuyLevelDes2ByName")

function GetActivityDungeon1002_BuyLevelDesWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1002_BuyLevelDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
