require("CommonResource_RedDotByName")
require("RogueBuild01_AchieveRewardTips_LockByName")

function GetRogueBuild01_AchieveRewardTips_TabUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.Lock = GetRogueBuild01_AchieveRewardTips_LockUis(ui:GetChild("Lock"))
  uis.c2Ctr = ui:GetController("c2")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
