require("BattleData_BattleFinishByName")

function GetBattleData_BattleFinishWindowUis(ui)
  local uis = {}
  uis.Main = GetBattleData_BattleFinishUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
