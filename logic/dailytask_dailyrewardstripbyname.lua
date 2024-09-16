function GetDailyTask_DailyRewardStripUis(ui)
  local uis = {}
  
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.RewardList = ui:GetChild("RewardList")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
