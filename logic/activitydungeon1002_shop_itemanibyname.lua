require("ActivityDungeon1002_Shop_ItemByName")

function GetActivityDungeon1002_Shop_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1002_Shop_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
