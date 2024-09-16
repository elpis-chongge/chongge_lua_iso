require("CommonResource_BackGroundByName")
require("InitialCarnival_TaskByName")
require("InitialCarnival_ShowByName")
require("InitialCarnival_CarnivalTabByName")

function GetInitialCarnival_CarnivalUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Task1 = GetInitialCarnival_TaskUis(ui:GetChild("Task1"))
  uis.Task2 = GetInitialCarnival_TaskUis(ui:GetChild("Task2"))
  uis.Task3 = GetInitialCarnival_TaskUis(ui:GetChild("Task3"))
  uis.Task4 = GetInitialCarnival_TaskUis(ui:GetChild("Task4"))
  uis.Task5 = GetInitialCarnival_TaskUis(ui:GetChild("Task5"))
  uis.Task6 = GetInitialCarnival_TaskUis(ui:GetChild("Task6"))
  uis.Show = GetInitialCarnival_ShowUis(ui:GetChild("Show"))
  uis.Tab = GetInitialCarnival_CarnivalTabUis(ui:GetChild("Tab"))
  uis.PositionBtn = ui:GetChild("PositionBtn")
  uis.root = ui
  return uis
end
