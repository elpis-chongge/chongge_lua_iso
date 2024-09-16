require("ActivityDungeon1_Shop_ItemByName")

function GetActivityDungeon1_Shop_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1_Shop_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
