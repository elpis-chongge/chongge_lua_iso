require("RogueBuild01_DetailsRegion1TypeByName")

function GetRogueBuild01_DetailsRegion1_CardUis(ui)
  local uis = {}
  uis.Type = GetRogueBuild01_DetailsRegion1TypeUis(ui:GetChild("Type"))
  uis.CardList = ui:GetChild("CardList")
  uis.root = ui
  return uis
end
