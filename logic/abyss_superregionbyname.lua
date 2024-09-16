require("Abyss_Super_TimeByName")
require("Abyss_BuildTipsEndByName")
require("Abyss_BuildTipsLockByName")

function GetAbyss_SuperRegionUis(ui)
  local uis = {}
  uis.Time = GetAbyss_Super_TimeUis(ui:GetChild("Time"))
  uis.RewardBtn = ui:GetChild("RewardBtn")
  uis.ProgressList = ui:GetChild("ProgressList")
  uis.GoBtn = ui:GetChild("GoBtn")
  uis.End = GetAbyss_BuildTipsEndUis(ui:GetChild("End"))
  uis.Lock = GetAbyss_BuildTipsLockUis(ui:GetChild("Lock"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
