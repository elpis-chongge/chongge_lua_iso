require("BattleData_BallteRaid_SureByName")
require("BattleData_BallteRaid_ResignByName")

function GetBattleData_BallteRaid_RegionUis(ui)
  local uis = {}
  uis.ResignBtn = ui:GetChild("ResignBtn")
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.Sure = GetBattleData_BallteRaid_SureUis(ui:GetChild("Sure"))
  uis.Resign = GetBattleData_BallteRaid_ResignUis(ui:GetChild("Resign"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
