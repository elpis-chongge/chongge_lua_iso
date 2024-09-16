require("Passport_TaskMaxByName")

function GetPassport_TaskRegionUis(ui)
  local uis = {}
  uis.TaskCycleList = ui:GetChild("TaskCycleList")
  uis.TaskList = ui:GetChild("TaskList")
  uis.TaskMax = GetPassport_TaskMaxUis(ui:GetChild("TaskMax"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
