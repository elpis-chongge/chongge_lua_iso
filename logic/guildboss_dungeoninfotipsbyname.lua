require("GuildBoss_DungeonInfoBattleNumberByName")
require("GuildBoss_DungeonInfoIntegralByName")
require("GuildBoss_DungeonInfoExplainTitleByName")

function GetGuildBoss_DungeonInfoTipsUis(ui)
  local uis = {}
  uis.BattleNumber = GetGuildBoss_DungeonInfoBattleNumberUis(ui:GetChild("BattleNumber"))
  uis.Integral = GetGuildBoss_DungeonInfoIntegralUis(ui:GetChild("Integral"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.ExplainTitle = GetGuildBoss_DungeonInfoExplainTitleUis(ui:GetChild("ExplainTitle"))
  uis.RecommendBtn = ui:GetChild("RecommendBtn")
  uis.SkillList = ui:GetChild("SkillList")
  uis.WordList = ui:GetChild("WordList")
  uis.StartBtn = ui:GetChild("StartBtn")
  uis.TestBtn = ui:GetChild("TestBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
