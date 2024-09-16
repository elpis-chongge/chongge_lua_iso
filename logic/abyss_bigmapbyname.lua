require("CommonResource_BackGroundByName")
require("Abyss_BigMapPicDragByName")

function GetAbyss_BigMapUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.BigMapPicDrag = GetAbyss_BigMapPicDragUis(ui:GetChild("BigMapPicDrag"))
  uis.MapCloseBtn = ui:GetChild("MapCloseBtn")
  uis.BigMapResetBtn = ui:GetChild("BigMapResetBtn")
  uis.root = ui
  return uis
end
