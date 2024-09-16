require("RogueBuild01_Shop_PointItemBgByName")

function GetRogueBuild01_Shop_PointItemUis(ui)
  local uis = {}
  uis.Bg = GetRogueBuild01_Shop_PointItemBgUis(ui:GetChild("Bg"))
  uis.root = ui
  return uis
end
