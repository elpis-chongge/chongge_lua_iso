require("Tower_CheckpointNumberByName")

function GetTower_CheckpointBtnUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.CheckpointNumber = GetTower_CheckpointNumberUis(ui:GetChild("CheckpointNumber"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
