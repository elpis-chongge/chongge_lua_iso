require("BattleData_MonsterHPWord2ByName")

function GetBattleData_MonsterHP1Uis(ui)
  local uis = {}
  uis.Word = GetBattleData_MonsterHPWord2Uis(ui:GetChild("Word"))
  uis.MonsterHPProgressBar = ui:GetChild("MonsterHPProgressBar")
  uis.root = ui
  return uis
end
