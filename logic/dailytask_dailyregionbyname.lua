require("DailyTask_DayRewardByName")

function GetDailyTask_DailyRegionUis(ui)
  local uis = {}
  uis.DailyList = ui:GetChild("DailyList")
  uis.DayReward = GetDailyTask_DayRewardUis(ui:GetChild("DayReward"))
  uis.root = ui
  return uis
end
