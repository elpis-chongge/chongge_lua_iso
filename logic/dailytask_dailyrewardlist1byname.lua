function GetDailyTask_DailyRewardList1Uis(ui)
  local uis = {}
  
  uis.RewardList = ui:GetChild("RewardList")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.root = ui
  return uis
end
