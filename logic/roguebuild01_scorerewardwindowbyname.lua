require("RogueBuild01_ScoreRewardByName")

function GetRogueBuild01_ScoreRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_ScoreRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
