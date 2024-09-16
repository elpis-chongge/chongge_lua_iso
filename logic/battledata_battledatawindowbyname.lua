require("BattleData_BattleDataByName")

function GetBattleData_BattleDataWindowUis(ui)
  local uis = {}
  uis.Main = GetBattleData_BattleDataUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
