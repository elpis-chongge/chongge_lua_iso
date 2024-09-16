require("Passport_TaskByName")

function GetPassport_TaskAniUis(ui)
  local uis = {}
  uis.Task = GetPassport_TaskUis(ui:GetChild("Task"))
  uis.root = ui
  return uis
end
