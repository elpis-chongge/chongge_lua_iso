require("Abyss_BigMapPic1ByName")

function GetAbyss_BigMapPicUis(ui)
  local uis = {}
  uis.BigMapPic1 = GetAbyss_BigMapPic1Uis(ui:GetChild("BigMapPic1"))
  uis.FogHolder = ui:GetChild("FogHolder")
  uis.root = ui
  return uis
end
