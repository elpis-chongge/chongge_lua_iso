require("ActivityDungeon1001_MiniMain_TodayTaskByName")

function GetActivityDungeon1001_MiniMain_BottonUis(ui)
  local uis = {}
  uis.TaskBtn = ui:GetChild("TaskBtn")
  uis.RecordBtn = ui:GetChild("RecordBtn")
  uis.TodayTask = GetActivityDungeon1001_MiniMain_TodayTaskUis(ui:GetChild("TodayTask"))
  uis.root = ui
  return uis
end
