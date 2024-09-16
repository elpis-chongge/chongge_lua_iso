require("BattleData_CureProgressFillByName")

function GetBattleData_CureProgressBarUis(ui)
  local uis = {}
  uis.bar = GetBattleData_CureProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
