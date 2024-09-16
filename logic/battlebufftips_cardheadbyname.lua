require("BattleBuffTips_CardHeadBgByName")
require("CommonResource_OccupationByName")

function GetBattleBuffTips_CardHeadUis(ui)
  local uis = {}
  uis.Pic = GetBattleBuffTips_CardHeadBgUis(ui:GetChild("Pic"))
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.HpProgressBar = ui:GetChild("HpProgressBar")
  uis.BuffList = ui:GetChild("BuffList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
