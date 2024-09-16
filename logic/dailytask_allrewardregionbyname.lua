require("DailyTask_TaskShowByName")

function GetDailyTask_AllRewardRegionUis(ui)
  local uis = {}
  uis.TaskShow = GetDailyTask_TaskShowUis(ui:GetChild("TaskShow"))
  uis.RewardList = ui:GetChild("RewardList")
  uis.root = ui
  return uis
end
