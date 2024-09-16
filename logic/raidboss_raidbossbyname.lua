require("CommonResource_BackGroundByName")
require("RaidBoss_BossMainByName")
require("RaidBoss_BattleStartMainByName")
require("CommonResource_CurrencyReturnByName")

function GetRaidBoss_RaidBossUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.BossMain = GetRaidBoss_BossMainUis(ui:GetChild("BossMain"))
  uis.BattleStartMain = GetRaidBoss_BattleStartMainUis(ui:GetChild("BattleStartMain"))
  uis.RewardBtn = ui:GetChild("RewardBtn")
  uis.RankBtn = ui:GetChild("RankBtn")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
