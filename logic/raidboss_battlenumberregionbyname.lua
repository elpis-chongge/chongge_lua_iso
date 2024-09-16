require("RaidBoss_BattleNumberRecordByName")
require("RaidBoss_BattleNumberNewByName")

function GetRaidBoss_BattleNumberRegionUis(ui)
  local uis = {}
  uis.BattleNumberRecord = GetRaidBoss_BattleNumberRecordUis(ui:GetChild("BattleNumberRecord"))
  uis.BattleNumberNew = GetRaidBoss_BattleNumberNewUis(ui:GetChild("BattleNumberNew"))
  uis.root = ui
  return uis
end
