require("BattleData_OwnHeadByName")

function GetBattleData_OwnPlayerUis(ui)
  local uis = {}
  uis.AxisHead = GetBattleData_OwnHeadUis(ui:GetChild("AxisHead"))
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
