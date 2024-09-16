require("DailyTask_RewardItem1ByName")

function GetDailyTask_DailyTipsUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.RewardItem1 = GetDailyTask_RewardItem1Uis(ui:GetChild("RewardItem1"))
  uis.RewardItem2 = GetDailyTask_RewardItem1Uis(ui:GetChild("RewardItem2"))
  uis.Submit1Txt = ui:GetChild("Submit1Txt")
  uis.RefreshBtn = ui:GetChild("RefreshBtn")
  uis.GoToBtn = ui:GetChild("GoToBtn")
  uis.MaxTxt = ui:GetChild("MaxTxt")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.SubmitBtn = ui:GetChild("SubmitBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
