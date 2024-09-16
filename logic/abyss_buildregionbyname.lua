require("Abyss_BuildTopInfoByName")
require("Abyss_BuildTipsEndByName")
require("Abyss_BuildTipsLockByName")

function GetAbyss_BuildRegionUis(ui)
  local uis = {}
  uis.BuildTopInfo = GetAbyss_BuildTopInfoUis(ui:GetChild("BuildTopInfo"))
  uis.ProgressList = ui:GetChild("ProgressList")
  uis.GoBtn = ui:GetChild("GoBtn")
  uis.RewardBtn = ui:GetChild("RewardBtn")
  uis.End = GetAbyss_BuildTipsEndUis(ui:GetChild("End"))
  uis.Lock = GetAbyss_BuildTipsLockUis(ui:GetChild("Lock"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
