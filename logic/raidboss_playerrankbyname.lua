require("CommonResource_PopupBgByName")
require("RaidBoss_PlayerRankTitleByName")
require("RaidBoss_NowRank1ByName")
require("RaidBoss_NowRank2ByName")
require("RaidBoss_PlayerRankEmptyByName")
require("RaidBoss_PlayerRankTipsListByName")

function GetRaidBoss_PlayerRankUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.PlayerRankTitle = GetRaidBoss_PlayerRankTitleUis(ui:GetChild("PlayerRankTitle"))
  uis.NowRank = GetRaidBoss_NowRank1Uis(ui:GetChild("NowRank"))
  uis.NowRank2 = GetRaidBoss_NowRank2Uis(ui:GetChild("NowRank2"))
  uis.PlayerRankEmpty = GetRaidBoss_PlayerRankEmptyUis(ui:GetChild("PlayerRankEmpty"))
  uis.PlayerRankTipsList = GetRaidBoss_PlayerRankTipsListUis(ui:GetChild("PlayerRankTipsList"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
