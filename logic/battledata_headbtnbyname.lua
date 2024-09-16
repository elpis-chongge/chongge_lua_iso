require("BattleData_CardTypeByName")
require("BattleData_MonsterTypeByName")
require("BattleData_MonsterSignByName")

function GetBattleData_HeadBtnUis(ui)
  local uis = {}
  uis.PlayerHead = GetBattleData_CardTypeUis(ui:GetChild("PlayerHead"))
  uis.MonsterLoader = GetBattleData_MonsterTypeUis(ui:GetChild("MonsterLoader"))
  uis.MonsterSign = GetBattleData_MonsterSignUis(ui:GetChild("MonsterSign"))
  uis.buttonCtr = ui:GetController("button")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
