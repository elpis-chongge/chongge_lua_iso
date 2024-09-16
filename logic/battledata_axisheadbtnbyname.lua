require("BattleData_AxisCardTypeByName")
require("BattleData_AxisMonsterTypeByName")
require("BattleData_MonsterSignByName")

function GetBattleData_AxisHeadBtnUis(ui)
  local uis = {}
  uis.PlayerHead = GetBattleData_AxisCardTypeUis(ui:GetChild("PlayerHead"))
  uis.MonsterLoader = GetBattleData_AxisMonsterTypeUis(ui:GetChild("MonsterLoader"))
  uis.MonsterSign = GetBattleData_MonsterSignUis(ui:GetChild("MonsterSign"))
  uis.buttonCtr = ui:GetController("button")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
