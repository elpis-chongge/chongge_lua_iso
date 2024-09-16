require("BattleData_DamageProgressFillByName")

function GetBattleData_DamageProgressBarUis(ui)
  local uis = {}
  uis.bar = GetBattleData_DamageProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
