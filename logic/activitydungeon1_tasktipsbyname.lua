require("ActivityDungeon1_TaskProgressByName")

function GetActivityDungeon1_TaskTipsUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.RewardList = ui:GetChild("RewardList")
  uis.TaskProgress = GetActivityDungeon1_TaskProgressUis(ui:GetChild("TaskProgress"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
