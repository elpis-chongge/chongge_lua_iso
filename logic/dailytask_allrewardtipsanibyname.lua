require("DailyTask_AllRewardTipsByName")

function GetDailyTask_AllRewardTipsAniUis(ui)
  local uis = {}
  uis.AllRewardTips = GetDailyTask_AllRewardTipsUis(ui:GetChild("AllRewardTips"))
  uis.root = ui
  return uis
end
