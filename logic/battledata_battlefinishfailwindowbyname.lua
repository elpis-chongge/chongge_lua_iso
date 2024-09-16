require("BattleData_BattleFinishFailByName")

function GetBattleData_BattleFinishFailWindowUis(ui)
  local uis = {}
  uis.Main = GetBattleData_BattleFinishFailUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
