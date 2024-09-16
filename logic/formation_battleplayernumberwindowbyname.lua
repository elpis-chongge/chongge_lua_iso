require("Formation_BattlePlayerNumberByName")

function GetFormation_BattlePlayerNumberWindowUis(ui)
  local uis = {}
  uis.Main = GetFormation_BattlePlayerNumberUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
