require("RogueBuild01_DetailsCardByName")

function GetRogueBuild01_DetailsRegion1_CardAniUis(ui)
  local uis = {}
  uis.Card = GetRogueBuild01_DetailsCardUis(ui:GetChild("Card"))
  uis.root = ui
  return uis
end
