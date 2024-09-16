require("RogueBuild01_ScoreRewardProgressFillByName")
require("RogueBuild01_ScoreRewardItemStripByName")

function GetRogueBuild01_ScoreRewardProgressBarUis(ui)
  local uis = {}
  uis.bar = GetRogueBuild01_ScoreRewardProgressFillUis(ui:GetChild("bar"))
  uis.Strip = GetRogueBuild01_ScoreRewardItemStripUis(ui:GetChild("Strip"))
  uis.root = ui
  return uis
end
