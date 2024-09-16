require("BattleData_ExpProgressFillByName")

function GetBattleData_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetBattleData_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
