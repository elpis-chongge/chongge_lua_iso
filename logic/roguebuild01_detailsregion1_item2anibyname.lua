require("RogueBuild01_DetailsRegion1_Item2_1ByName")

function GetRogueBuild01_DetailsRegion1_Item2AniUis(ui)
  local uis = {}
  uis.Item = GetRogueBuild01_DetailsRegion1_Item2_1Uis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
