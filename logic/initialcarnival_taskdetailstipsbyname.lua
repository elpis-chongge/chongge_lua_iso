require("InitialCarnival_TaskDetailsTimeByName")
require("InitialCarnival_TaskDetailsProgressByName")
require("InitialCarnival_TaskDetailsCompleteByName")

function GetInitialCarnival_TaskDetailsTipsUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Time = GetInitialCarnival_TaskDetailsTimeUis(ui:GetChild("Time"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Progress = GetInitialCarnival_TaskDetailsProgressUis(ui:GetChild("Progress"))
  uis.RewardNameTxt = ui:GetChild("RewardNameTxt")
  uis.GoToBtn = ui:GetChild("GoToBtn")
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.Complete = GetInitialCarnival_TaskDetailsCompleteUis(ui:GetChild("Complete"))
  uis.ItemList = ui:GetChild("ItemList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
