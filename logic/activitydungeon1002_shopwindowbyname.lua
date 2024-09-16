require("ActivityDungeon1002_ShopByName")

function GetActivityDungeon1002_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1002_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
