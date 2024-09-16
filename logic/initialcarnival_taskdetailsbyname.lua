require("CommonResource_PopupBgByName")
require("InitialCarnival_TaskDetailsTipsByName")

function GetInitialCarnival_TaskDetailsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.TaskDetailsTips = GetInitialCarnival_TaskDetailsTipsUis(ui:GetChild("TaskDetailsTips"))
  uis.root = ui
  return uis
end
