require("RogueBuild01_ScoreRewardExpProgressFillByName")

function GetRogueBuild01_ScoreRewardExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetRogueBuild01_ScoreRewardExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
