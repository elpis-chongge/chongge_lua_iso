require("CommonResource_BackGroundByName")
require("GuildBoss_GuildBossTitleByName")
require("GuildBoss_GuildBossRoundByName")
require("GuildBoss_GuildBossTimeByName")
require("GuildBoss_GuildBossBattleNumberByName")

function GetGuildBoss_GuildBossUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.Title = GetGuildBoss_GuildBossTitleUis(ui:GetChild("Title"))
  uis.MemberBtn = ui:GetChild("MemberBtn")
  uis.BadgeBtn = ui:GetChild("BadgeBtn")
  uis.BattleBtn = ui:GetChild("BattleBtn")
  uis.Round = GetGuildBoss_GuildBossRoundUis(ui:GetChild("Round"))
  uis.TaskBtn = ui:GetChild("TaskBtn")
  uis.LogBtn = ui:GetChild("LogBtn")
  uis.RankBtn = ui:GetChild("RankBtn")
  uis.RankRewardBtn = ui:GetChild("RankRewardBtn")
  uis.SkillBtn = ui:GetChild("SkillBtn")
  uis.HelpBtn = ui:GetChild("HelpBtn")
  uis.EndTime = GetGuildBoss_GuildBossTimeUis(ui:GetChild("EndTime"))
  uis.BattleNumber = GetGuildBoss_GuildBossBattleNumberUis(ui:GetChild("BattleNumber"))
  uis.ExplainBtn = ui:GetChild("ExplainBtn")
  uis.root = ui
  return uis
end
