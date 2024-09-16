require("BattleBuffTips_MonsterHeadBgByName")
require("CommonResource_OccupationByName")
require("BattleBuffTips_MonsterSignByName")

function GetBattleBuffTips_MonsterHeadUis(ui)
  local uis = {}
  uis.Pic = GetBattleBuffTips_MonsterHeadBgUis(ui:GetChild("Pic"))
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.HpProgressBar = ui:GetChild("HpProgressBar")
  uis.BuffList = ui:GetChild("BuffList")
  uis.n45 = GetBattleBuffTips_MonsterSignUis(ui:GetChild("n45"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
