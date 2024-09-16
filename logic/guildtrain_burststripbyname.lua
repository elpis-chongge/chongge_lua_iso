require("GuildTrain_LeaderHeadByName")
require("GuildTrain_BurstStripTipsByName")

function GetGuildTrain_BurstStripUis(ui)
  local uis = {}
  uis.LeaderHead = GetGuildTrain_LeaderHeadUis(ui:GetChild("LeaderHead"))
  uis.OccupationList = ui:GetChild("OccupationList")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.BurstStripTips = GetGuildTrain_BurstStripTipsUis(ui:GetChild("BurstStripTips"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
