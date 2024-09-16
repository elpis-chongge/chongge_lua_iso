require("RogueBuild01_DetailsRegion1TypeByName")

function GetRogueBuild01_DetailsRegion1_Item1Uis(ui)
  local uis = {}
  uis.Type = GetRogueBuild01_DetailsRegion1TypeUis(ui:GetChild("Type"))
  uis.ItemList = ui:GetChild("ItemList")
  uis.root = ui
  return uis
end
