require("CommonResource_BackGroundByName")
require("BattleData_OwnByName")
require("BattleData_GuildSkillRegionByName")
require("BattleData_EnemyByName")

function GetBattleData_BattleDataUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.TitleWinTxt = ui:GetChild("TitleWinTxt")
  uis.TitleFailTxt = ui:GetChild("TitleFailTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Own = GetBattleData_OwnUis(ui:GetChild("Own"))
  uis.OwnSkill = GetBattleData_GuildSkillRegionUis(ui:GetChild("OwnSkill"))
  uis.Enemy = GetBattleData_EnemyUis(ui:GetChild("Enemy"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.RoundList = ui:GetChild("RoundList")
  uis.SwitchBtn = ui:GetChild("SwitchBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.roundCtr = ui:GetController("round")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
