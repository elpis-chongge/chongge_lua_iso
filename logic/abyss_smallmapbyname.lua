require("Abyss_SmallMapPicByName")

function GetAbyss_SmallMapUis(ui)
  local uis = {}
  uis.SmallMapPic = GetAbyss_SmallMapPicUis(ui:GetChild("SmallMapPic"))
  uis.root = ui
  return uis
end
