require("ActivityDungeon1002_MiniMain_TodayTaskByName")

function GetActivityDungeon1002_MiniMain_BottonUis(ui)
  local uis = {}
  uis.TaskBtn = ui:GetChild("TaskBtn")
  uis.RecordBtn = ui:GetChild("RecordBtn")
  uis.TodayTask = GetActivityDungeon1002_MiniMain_TodayTaskUis(ui:GetChild("TodayTask"))
  uis.root = ui
  return uis
end
