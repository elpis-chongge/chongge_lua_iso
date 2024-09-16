require("BattleData_MonsterHP1ByName")
require("BattleData_MonsterHP2ByName")

function GetBattleData_MonsterHPRegionUis(ui)
  local uis = {}
  uis.MonsterHP1 = GetBattleData_MonsterHP1Uis(ui:GetChild("MonsterHP1"))
  uis.MonsterHP2 = GetBattleData_MonsterHP2Uis(ui:GetChild("MonsterHP2"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
