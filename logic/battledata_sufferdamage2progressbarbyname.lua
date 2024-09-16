require("BattleData_SufferDamage2ProgressFillByName")

function GetBattleData_SufferDamage2ProgressBarUis(ui)
  local uis = {}
  uis.bar = GetBattleData_SufferDamage2ProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
