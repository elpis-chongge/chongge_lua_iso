require("BattleData_MonsterHPProgressFillByName")

function GetBattleData_MonsterHPProgressBarUis(ui)
  local uis = {}
  uis.bar = GetBattleData_MonsterHPProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
