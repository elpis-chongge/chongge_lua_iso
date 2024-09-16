require("RogueBuild01_ItemLook_SacredItemByName")

function GetRogueBuild01_ItemLook_SacredItemAniUis(ui)
  local uis = {}
  uis.Item = GetRogueBuild01_ItemLook_SacredItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
