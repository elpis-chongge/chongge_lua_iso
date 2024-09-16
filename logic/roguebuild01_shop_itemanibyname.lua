require("RogueBuild01_Shop_ItemByName")

function GetRogueBuild01_Shop_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetRogueBuild01_Shop_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
