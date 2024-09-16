require("RogueBuild01_ScoreRewardTipsListByName")
require("RogueBuild01_ScoreRewardSpecialByName")

function GetRogueBuild01_ScoreRewardTipsUis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.RewardList = GetRogueBuild01_ScoreRewardTipsListUis(ui:GetChild("RewardList"))
  uis.RewardSpecial = GetRogueBuild01_ScoreRewardSpecialUis(ui:GetChild("RewardSpecial"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
