require("Abyss_CycleCommodity4ByName")

function GetAbyss_CycleCommodityAni4Uis(ui)
  local uis = {}
  uis.Item = GetAbyss_CycleCommodity4Uis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
