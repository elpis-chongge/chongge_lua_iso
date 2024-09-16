require("RogueBuild01_DetailsItem1ByName")

function GetRogueBuild01_DetailsItem1AniUis(ui)
  local uis = {}
  uis.Item = GetRogueBuild01_DetailsItem1Uis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
