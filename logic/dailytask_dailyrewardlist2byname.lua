require("CommonResource_PopupBgByName")
require("DailyTask_DailyRewardList1ByName")

function GetDailyTask_DailyRewardList2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.DailyRewardList1 = GetDailyTask_DailyRewardList1Uis(ui:GetChild("DailyRewardList1"))
  uis.root = ui
  return uis
end
