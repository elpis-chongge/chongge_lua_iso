require("CommonResource_BackGroundByName")
require("DailyTask_DailyRegionByName")
require("DailyTask_AllRewardRegionByName")
require("DailyTask_TabRegionByName")

function GetDailyTask_DailyTaskUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.DailyRegion = GetDailyTask_DailyRegionUis(ui:GetChild("DailyRegion"))
  uis.AllRewardRegion = GetDailyTask_AllRewardRegionUis(ui:GetChild("AllRewardRegion"))
  uis.TabRegion = GetDailyTask_TabRegionUis(ui:GetChild("TabRegion"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
