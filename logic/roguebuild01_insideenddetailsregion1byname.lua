require("RogueBuild01_DetailsRegion1_WordByName")
require("RogueBuild01_DetailsRegion1_CardByName")
require("RogueBuild01_DetailsRegion1_Item1ByName")
require("RogueBuild01_DetailsRegion1_Item2ByName")

function GetRogueBuild01_InsideEndDetailsRegion1Uis(ui)
  local uis = {}
  uis.Word = GetRogueBuild01_DetailsRegion1_WordUis(ui:GetChild("Word"))
  uis.Card = GetRogueBuild01_DetailsRegion1_CardUis(ui:GetChild("Card"))
  uis.Item1 = GetRogueBuild01_DetailsRegion1_Item1Uis(ui:GetChild("Item1"))
  uis.Item2 = GetRogueBuild01_DetailsRegion1_Item2Uis(ui:GetChild("Item2"))
  uis.root = ui
  return uis
end
