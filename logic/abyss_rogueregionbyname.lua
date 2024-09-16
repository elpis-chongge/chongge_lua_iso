require("Abyss_RogueScoreByName")
require("Abyss_BuildTipsLockByName")

function GetAbyss_RogueRegionUis(ui)
  local uis = {}
  uis.Score = GetAbyss_RogueScoreUis(ui:GetChild("Score"))
  uis.ScoreRewardBtn = ui:GetChild("ScoreRewardBtn")
  uis.RogueLetterBtn = ui:GetChild("RogueLetterBtn")
  uis.GoBtn = ui:GetChild("GoBtn")
  uis.Lock = GetAbyss_BuildTipsLockUis(ui:GetChild("Lock"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
