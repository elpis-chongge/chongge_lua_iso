require("RogueBuild01_AchieveRewardTips_TabByName")

function GetRogueBuild01_AchieveRewardTips_TabBtnUis(ui)
  local uis = {}
  uis.Tab = GetRogueBuild01_AchieveRewardTips_TabUis(ui:GetChild("Tab"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
