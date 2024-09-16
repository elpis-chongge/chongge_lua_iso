require("RogueBuild01_AchieveContent_ProgressByName")
require("RogueBuild01_AchieveContent_NewByName")
require("CommonResource_RedDotByName")
require("RogueBuild01_AchieveContent_LockByName")

function GetRogueBuild01_AchieveContentBtnUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Progress = GetRogueBuild01_AchieveContent_ProgressUis(ui:GetChild("Progress"))
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.New = GetRogueBuild01_AchieveContent_NewUis(ui:GetChild("New"))
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.Lock = GetRogueBuild01_AchieveContent_LockUis(ui:GetChild("Lock"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
