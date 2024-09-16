require("DailyTask_DailyRewardList2ByName")

function GetDailyTask_DailyRewardListWindowUis(ui)
  local uis = {}
  uis.Main = GetDailyTask_DailyRewardList2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
