require("RaidBoss_BattleInfo1ByName")
require("RaidBoss_BattleInfoByName")

function GetRaidBoss_BattleStartMainUis(ui)
  local uis = {}
  uis.BattleInfo1 = GetRaidBoss_BattleInfo1Uis(ui:GetChild("BattleInfo1"))
  uis.BattleOutBtn = ui:GetChild("BattleOutBtn")
  uis.BattleRecordBtn = ui:GetChild("BattleRecordBtn")
  uis.BattleInfo = GetRaidBoss_BattleInfoUis(ui:GetChild("BattleInfo"))
  uis.root = ui
  return uis
end
