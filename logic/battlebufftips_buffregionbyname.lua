require("BattleBuffTips_BuffNothingByName")
require("BattleBuffTips_BuffTitleByName")

function GetBattleBuffTips_BuffRegionUis(ui)
  local uis = {}
  uis.BuffNothing = GetBattleBuffTips_BuffNothingUis(ui:GetChild("BuffNothing"))
  uis.BuffTitle = GetBattleBuffTips_BuffTitleUis(ui:GetChild("BuffTitle"))
  uis.BuffList = ui:GetChild("BuffList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
