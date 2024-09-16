require("RogueBuild01_DetailsRegion2_Difficulty1ByName")
require("RogueBuild01_DetailsRegion2_Difficulty2ByName")

function GetRogueBuild01_DetailsRegion2_DifficultyUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Difficulty = GetRogueBuild01_DetailsRegion2_Difficulty1Uis(ui:GetChild("Difficulty"))
  uis.Score = GetRogueBuild01_DetailsRegion2_Difficulty2Uis(ui:GetChild("Score"))
  uis.root = ui
  return uis
end
