require("Formation_LeaderHeadByName")
require("Formation_BurstStripTipsByName")

function GetFormation_BurstStripUis(ui)
  local uis = {}
  uis.LeaderHead = GetFormation_LeaderHeadUis(ui:GetChild("LeaderHead"))
  uis.OccupationList = ui:GetChild("OccupationList")
  uis.BurstStripTips = GetFormation_BurstStripTipsUis(ui:GetChild("BurstStripTips"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
