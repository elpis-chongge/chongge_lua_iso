require("Abyss_CycleCommodity1ByName")

function GetAbyss_CycleCommodityAni1Uis(ui)
  local uis = {}
  uis.Item = GetAbyss_CycleCommodity1Uis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
