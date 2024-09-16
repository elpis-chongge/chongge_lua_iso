require("Formation_BurstTips1ByName")
require("Formation_BurstTips2ByName")
require("Formation_BurstTips3ByName")

function GetFormation_BurstTipsRegionUis(ui)
  local uis = {}
  uis.BurstTab1Btn = ui:GetChild("BurstTab1Btn")
  uis.BurstTab2Btn = ui:GetChild("BurstTab2Btn")
  uis.BurstTab3Btn = ui:GetChild("BurstTab3Btn")
  uis.BurstTips1 = GetFormation_BurstTips1Uis(ui:GetChild("BurstTips1"))
  uis.BurstTips2 = GetFormation_BurstTips2Uis(ui:GetChild("BurstTips2"))
  uis.BurstTips3 = GetFormation_BurstTips3Uis(ui:GetChild("BurstTips3"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
