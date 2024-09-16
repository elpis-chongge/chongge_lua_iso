require("ActivityDungeon1001_Shop_ItemByName")

function GetActivityDungeon1001_Shop_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1001_Shop_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
