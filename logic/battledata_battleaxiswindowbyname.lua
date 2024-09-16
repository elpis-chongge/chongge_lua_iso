require("BattleData_BattleAxisByName")

function GetBattleData_BattleAxisWindowUis(ui)
  local uis = {}
  uis.Main = GetBattleData_BattleAxisUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
