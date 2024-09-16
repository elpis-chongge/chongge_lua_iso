require("Abyss_CycleCommodity2ByName")

function GetAbyss_CycleCommodityAni2Uis(ui)
  local uis = {}
  uis.Item = GetAbyss_CycleCommodity2Uis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
