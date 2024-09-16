require("CommonResource_BackGroundByName")
require("BattleData_AxisOwnTileByName")
require("BattleData_AxisEnemyTileByName")
require("BattleData_BattleTimeByName")

function GetBattleData_BattleAxisUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.NameWinTxt = ui:GetChild("NameWinTxt")
  uis.NameFailTxt = ui:GetChild("NameFailTxt")
  uis.ScaleList = ui:GetChild("ScaleList")
  uis.AxisOwnTile = GetBattleData_AxisOwnTileUis(ui:GetChild("AxisOwnTile"))
  uis.AxisEnemyTile = GetBattleData_AxisEnemyTileUis(ui:GetChild("AxisEnemyTile"))
  uis.BattleTime = GetBattleData_BattleTimeUis(ui:GetChild("BattleTime"))
  uis.Switch1Btn = ui:GetChild("Switch1Btn")
  uis.Switch2Btn = ui:GetChild("Switch2Btn")
  uis.Switch4Btn = ui:GetChild("Switch4Btn")
  uis.Switch5Btn = ui:GetChild("Switch5Btn")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.RoundList = ui:GetChild("RoundList")
  uis.c1Ctr = ui:GetController("c1")
  uis.roundCtr = ui:GetController("round")
  uis.guildskillCtr = ui:GetController("guildskill")
  uis.root = ui
  return uis
end
