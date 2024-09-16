require("InitialCarnival_TaskDetailsByName")

function GetInitialCarnival_TaskDetailsWindowUis(ui)
  local uis = {}
  uis.Main = GetInitialCarnival_TaskDetailsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
