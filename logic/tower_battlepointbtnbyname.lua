require("Tower_BattlePointByName")

function GetTower_BattlePointBtnUis(ui)
  local uis = {}
  uis.BattlePoint = GetTower_BattlePointUis(ui:GetChild("BattlePoint"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
