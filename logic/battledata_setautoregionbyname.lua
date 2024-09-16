require("BattleData_SetAutoTips1ByName")
require("BattleData_SetAutoTipsByName")

function GetBattleData_SetAutoRegionUis(ui)
  local uis = {}
  uis.Tips1 = GetBattleData_SetAutoTips1Uis(ui:GetChild("Tips1"))
  uis.Tips = GetBattleData_SetAutoTipsUis(ui:GetChild("Tips"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
