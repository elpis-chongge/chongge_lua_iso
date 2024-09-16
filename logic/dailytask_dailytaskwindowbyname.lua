require("DailyTask_DailyTaskByName")

function GetDailyTask_DailyTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetDailyTask_DailyTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
