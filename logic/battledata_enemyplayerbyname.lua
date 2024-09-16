require("BattleData_EnemyHeadByName")

function GetBattleData_EnemyPlayerUis(ui)
  local uis = {}
  uis.AxisHead = GetBattleData_EnemyHeadUis(ui:GetChild("AxisHead"))
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
