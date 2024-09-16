require("BattleData_MonsterHPWordByName")
require("BattleData_MonsterHPWord1ByName")

function GetBattleData_MonsterHP2Uis(ui)
  local uis = {}
  uis.Word = GetBattleData_MonsterHPWordUis(ui:GetChild("Word"))
  uis.Word1 = GetBattleData_MonsterHPWord1Uis(ui:GetChild("Word1"))
  uis.root = ui
  return uis
end
