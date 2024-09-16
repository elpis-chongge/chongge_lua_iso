require("RaidBoss_RankRewardTipsByName")

function GetRaidBoss_RankRewardTipsAniUis(ui)
  local uis = {}
  uis.RankRewardTips = GetRaidBoss_RankRewardTipsUis(ui:GetChild("RankRewardTips"))
  uis.root = ui
  return uis
end
