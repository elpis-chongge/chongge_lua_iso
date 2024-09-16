require("RogueBuild01_DetailsRegion1_Item1_1ByName")

function GetRogueBuild01_DetailsRegion1_Item1AniUis(ui)
  local uis = {}
  uis.Item = GetRogueBuild01_DetailsRegion1_Item1_1Uis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
