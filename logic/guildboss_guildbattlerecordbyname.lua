require("CommonResource_BackGroundByName")
require("GuildBoss_GuildBattleRecordTitleByName")

function GetGuildBoss_GuildBattleRecordUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.Title = GetGuildBoss_GuildBattleRecordTitleUis(ui:GetChild("Title"))
  uis.RewardTipsList = ui:GetChild("RewardTipsList")
  uis.root = ui
  return uis
end
