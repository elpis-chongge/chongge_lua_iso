function GetRogueBuild01_ScoreRewardTipsListUis(ui)
  local uis = {}
  
  uis.RewardList = ui:GetChild("RewardList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
