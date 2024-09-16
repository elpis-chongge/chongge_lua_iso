require("RogueBuild01_DayRewardConditionByName")
require("RogueBuild01_DayRewardItemByName")

function GetRogueBuild01_AchieveRewardTipsUis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.Condition = GetRogueBuild01_DayRewardConditionUis(ui:GetChild("Condition"))
  uis.RewardItem = GetRogueBuild01_DayRewardItemUis(ui:GetChild("RewardItem"))
  uis.root = ui
  return uis
end
