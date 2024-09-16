require("RogueBuild01_ScoreRewardTipsByName")

function GetRogueBuild01_ScoreRewardTipsAniUis(ui)
  local uis = {}
  uis.ScoreRewardTips = GetRogueBuild01_ScoreRewardTipsUis(ui:GetChild("ScoreRewardTips"))
  uis.root = ui
  return uis
end
