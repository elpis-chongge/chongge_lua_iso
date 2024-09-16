require("InitialCarnival_TaskItemByName")
require("CommonResource_RedDotByName")

function GetInitialCarnival_TaskUis(ui)
  local uis = {}
  uis.TaskItem = GetInitialCarnival_TaskItemUis(ui:GetChild("TaskItem"))
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
