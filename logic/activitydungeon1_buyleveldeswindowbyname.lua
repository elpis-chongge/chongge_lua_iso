require("ActivityDungeon1_BuyLevelDes2ByName")

function GetActivityDungeon1_BuyLevelDesWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1_BuyLevelDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
