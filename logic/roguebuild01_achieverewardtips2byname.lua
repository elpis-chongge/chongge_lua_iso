require("CommonResource_PopupBgByName")
require("RogueBuild01_AchieveRewardTips1ByName")

function GetRogueBuild01_AchieveRewardTips2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Tips = GetRogueBuild01_AchieveRewardTips1Uis(ui:GetChild("Tips"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
