require("Abyss_CycleCommodity3ByName")

function GetAbyss_CycleCommodityAni3Uis(ui)
  local uis = {}
  uis.Item = GetAbyss_CycleCommodity3Uis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
