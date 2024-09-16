require("CommonResource_PopupBgByName")
require("RaidBoss_RewardTitleByName")
require("RaidBoss_DifficultyRewardTipsListByName")
require("RaidBoss_RankRewardTipsListByName")
require("RaidBoss_NowRankByName")

function GetRaidBoss_RewardShowUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.RewardTitle = GetRaidBoss_RewardTitleUis(ui:GetChild("RewardTitle"))
  uis.DifficultyRewardTipsList = GetRaidBoss_DifficultyRewardTipsListUis(ui:GetChild("DifficultyRewardTipsList"))
  uis.RankRewardTipsList = GetRaidBoss_RankRewardTipsListUis(ui:GetChild("RankRewardTipsList"))
  uis.NowRank = GetRaidBoss_NowRankUis(ui:GetChild("NowRank"))
  uis.Tab1Btn = ui:GetChild("Tab1Btn")
  uis.Tab2Btn = ui:GetChild("Tab2Btn")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
