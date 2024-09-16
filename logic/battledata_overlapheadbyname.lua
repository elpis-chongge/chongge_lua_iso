require("BattleData_AxisHeadByName")

function GetBattleData_OverlapHeadUis(ui)
  local uis = {}
  uis.AxisHead = GetBattleData_AxisHeadUis(ui:GetChild("AxisHead"))
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.root = ui
  return uis
end
