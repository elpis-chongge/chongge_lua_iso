require("CommonResource_BackGroundByName")
require("RogueBuild01_DetailsScoreByName")
require("RogueBuild01_DetailsTitleByName")
require("RogueBuild01_DetailsTimeByName")
require("RogueBuild01_DetailsDifficultyByName")
require("RogueBuild01_DetailsLayersByName")
require("CommonResource_CurrencyReturnByName")

function GetRogueBuild01_ScoreDetailsUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Number1Txt = ui:GetChild("Number1Txt")
  uis.Number2Txt = ui:GetChild("Number2Txt")
  uis.Number3Txt = ui:GetChild("Number3Txt")
  uis.CardList = ui:GetChild("CardList")
  uis.Item1List = ui:GetChild("Item1List")
  uis.Item2List = ui:GetChild("Item2List")
  uis.Score = GetRogueBuild01_DetailsScoreUis(ui:GetChild("Score"))
  uis.Title = GetRogueBuild01_DetailsTitleUis(ui:GetChild("Title"))
  uis.Time = GetRogueBuild01_DetailsTimeUis(ui:GetChild("Time"))
  uis.Difficulty = GetRogueBuild01_DetailsDifficultyUis(ui:GetChild("Difficulty"))
  uis.Layers = GetRogueBuild01_DetailsLayersUis(ui:GetChild("Layers"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
