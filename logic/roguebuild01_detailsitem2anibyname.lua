require("RogueBuild01_DetailsItem2ByName")

function GetRogueBuild01_DetailsItem2AniUis(ui)
  local uis = {}
  uis.Item = GetRogueBuild01_DetailsItem2Uis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
