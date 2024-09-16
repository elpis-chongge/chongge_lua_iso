require("CommonResource_BackGroundByName")
require("GuildBoss_GuildRankRewardTitleByName")
require("GuildBoss_GuildRankRewardInfoByName")

function GetGuildBoss_GuildRankRewardUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.Title = GetGuildBoss_GuildRankRewardTitleUis(ui:GetChild("Title"))
  uis.RewardTipsList = ui:GetChild("RewardTipsList")
  uis.Info = GetGuildBoss_GuildRankRewardInfoUis(ui:GetChild("Info"))
  uis.root = ui
  return uis
end
