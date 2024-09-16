require("RogueBuild01_AchieveRewardTips2ByName")

function GetRogueBuild01_AchieveRewardTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_AchieveRewardTips2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
