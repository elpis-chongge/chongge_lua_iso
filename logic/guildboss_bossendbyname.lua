require("CommonResource_BackGroundByName")
require("GuildBoss_BossEndWordByName")

function GetGuildBoss_BossEndUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Word = GetGuildBoss_BossEndWordUis(ui:GetChild("Word"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.RankRewardBtn = ui:GetChild("RankRewardBtn")
  uis.SkillBtn = ui:GetChild("SkillBtn")
  uis.RankBtn = ui:GetChild("RankBtn")
  uis.HelpBtn = ui:GetChild("HelpBtn")
  uis.root = ui
  return uis
end
