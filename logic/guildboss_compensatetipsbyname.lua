require("GuildBoss_CompensateTitleByName")
require("GuildBoss_CompensateNumberByName")
require("GuildBoss_CompensateZeroNumberByName")

function GetGuildBoss_CompensateTipsUis(ui)
  local uis = {}
  uis.Title1 = GetGuildBoss_CompensateTitleUis(ui:GetChild("Title1"))
  uis.LineupList = ui:GetChild("LineupList")
  uis.Title2 = GetGuildBoss_CompensateTitleUis(ui:GetChild("Title2"))
  uis.Number = GetGuildBoss_CompensateNumberUis(ui:GetChild("Number"))
  uis.BattleBtn = ui:GetChild("BattleBtn")
  uis.ZeroNumber = GetGuildBoss_CompensateZeroNumberUis(ui:GetChild("ZeroNumber"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
