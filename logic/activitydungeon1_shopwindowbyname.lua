require("ActivityDungeon1_ShopByName")

function GetActivityDungeon1_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
