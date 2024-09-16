require("ActivityDungeon1001_BuyLevelDes2ByName")

function GetActivityDungeon1001_BuyLevelDesWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1001_BuyLevelDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
