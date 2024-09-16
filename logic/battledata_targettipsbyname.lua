require("BattleData_TargetTips1ByName")

function GetBattleData_TargetTipsUis(ui)
  local uis = {}
  uis.Title = GetBattleData_TargetTips1Uis(ui:GetChild("Title"))
  uis.TipsList = ui:GetChild("TipsList")
  uis.root = ui
  return uis
end
