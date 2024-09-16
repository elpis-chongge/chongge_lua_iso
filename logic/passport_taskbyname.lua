require("Passport_TaskExpByName")

function GetPassport_TaskUis(ui)
  local uis = {}
  uis.TaskfreshBtn = ui:GetChild("TaskfreshBtn")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.ProgressTxt = ui:GetChild("ProgressTxt")
  uis.TaskGuideBtn = ui:GetChild("TaskGuideBtn")
  uis.TaskExp = GetPassport_TaskExpUis(ui:GetChild("TaskExp"))
  uis.GetTxt = ui:GetChild("GetTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
