require("DailyTask_UnOpenTipsByName")
require("DailyTask_CompleteTipsByName")

function GetDailyTask_AllRewardTipsUis(ui)
  local uis = {}
  uis.UnOpenTips = GetDailyTask_UnOpenTipsUis(ui:GetChild("UnOpenTips"))
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.RewardList = ui:GetChild("RewardList")
  uis.CompleteTips = GetDailyTask_CompleteTipsUis(ui:GetChild("CompleteTips"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
