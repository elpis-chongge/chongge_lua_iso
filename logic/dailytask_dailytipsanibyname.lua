require("DailyTask_DailyTipsByName")

function GetDailyTask_DailyTipsAniUis(ui)
  local uis = {}
  uis.DailyTips = GetDailyTask_DailyTipsUis(ui:GetChild("DailyTips"))
  uis.root = ui
  return uis
end
