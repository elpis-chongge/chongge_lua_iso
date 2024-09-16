require("RaidBoss_DifficultyRewardTipsByName")

function GetRaidBoss_DifficultyRewardTipsAniUis(ui)
  local uis = {}
  uis.DifficultyRewardTips = GetRaidBoss_DifficultyRewardTipsUis(ui:GetChild("DifficultyRewardTips"))
  uis.root = ui
  return uis
end
