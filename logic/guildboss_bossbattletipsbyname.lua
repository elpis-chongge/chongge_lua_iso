require("GuildBoss_BossBattleNameByName")
require("CommonResource_OccupationByName")
require("GuildBoss_BossBattleLockByName")
require("GuildBoss_BossBattleKillByName")

function GetGuildBoss_BossBattleTipsUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.Name = GetGuildBoss_BossBattleNameUis(ui:GetChild("Name"))
  uis.HpProgressBar = ui:GetChild("HpProgressBar")
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.Lock = GetGuildBoss_BossBattleLockUis(ui:GetChild("Lock"))
  uis.Kill = GetGuildBoss_BossBattleKillUis(ui:GetChild("Kill"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
