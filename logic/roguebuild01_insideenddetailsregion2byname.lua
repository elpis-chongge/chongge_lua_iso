require("RogueBuild01_DetailsRegion2_ScoreByName")
require("RogueBuild01_DetailsRegion2_DifficultyByName")
require("RogueBuild01_DetailsRegion2_ExpByName")
require("RogueBuild01_DetailsRegion2_InfoByName")

function GetRogueBuild01_InsideEndDetailsRegion2Uis(ui)
  local uis = {}
  uis.Score = GetRogueBuild01_DetailsRegion2_ScoreUis(ui:GetChild("Score"))
  uis.Difficulty = GetRogueBuild01_DetailsRegion2_DifficultyUis(ui:GetChild("Difficulty"))
  uis.Exp = GetRogueBuild01_DetailsRegion2_ExpUis(ui:GetChild("Exp"))
  uis.Info1 = GetRogueBuild01_DetailsRegion2_InfoUis(ui:GetChild("Info1"))
  uis.Info2 = GetRogueBuild01_DetailsRegion2_InfoUis(ui:GetChild("Info2"))
  uis.root = ui
  return uis
end
