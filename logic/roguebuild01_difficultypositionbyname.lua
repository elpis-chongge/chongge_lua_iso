require("RogueBuild01_DifficultyPositionTitleByName")
require("RogueBuild01_DifficultyPositionLockByName")

function GetRogueBuild01_DifficultyPositionUis(ui)
  local uis = {}
  uis.Title = GetRogueBuild01_DifficultyPositionTitleUis(ui:GetChild("Title"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.Lock = GetRogueBuild01_DifficultyPositionLockUis(ui:GetChild("Lock"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.lockCtr = ui:GetController("lock")
  uis.root = ui
  return uis
end
