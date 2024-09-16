require("BattleData_BurstSignByName")

function GetBattleData_EnemyBurstBottomUis(ui)
  local uis = {}
  uis.BurstSign = GetBattleData_BurstSignUis(ui:GetChild("BurstSign"))
  uis.root = ui
  return uis
end
