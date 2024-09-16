require("ActivityDungeon1001_ShopByName")

function GetActivityDungeon1001_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1001_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
