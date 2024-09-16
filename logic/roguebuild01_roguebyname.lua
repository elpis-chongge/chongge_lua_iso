require("CommonResource_BackGroundByName")
require("RogueBuild01_CoverTitleByName")
require("RogueBuild01_CoverLayersByName")
require("CommonResource_CurrencyReturnByName")

function GetRogueBuild01_RogueUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.CoverTitle = GetRogueBuild01_CoverTitleUis(ui:GetChild("CoverTitle"))
  uis.CoverStartBtn = ui:GetChild("CoverStartBtn")
  uis.CoverLayers = GetRogueBuild01_CoverLayersUis(ui:GetChild("CoverLayers"))
  uis.CoverDifficultyBtn = ui:GetChild("CoverDifficultyBtn")
  uis.CoverGiveUpBtn = ui:GetChild("CoverGiveUpBtn")
  uis.CoverScoreBtn = ui:GetChild("CoverScoreBtn")
  uis.CoverSweepBtn = ui:GetChild("CoverSweepBtn")
  uis.CoverScoreRewardBtn = ui:GetChild("CoverScoreRewardBtn")
  uis.CoverLetterBtn = ui:GetChild("CoverLetterBtn")
  uis.CoverHandBookBtn = ui:GetChild("CoverHandBookBtn")
  uis.CoverTalentBtn = ui:GetChild("CoverTalentBtn")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
