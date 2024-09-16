require("ActivityDungeon1001_TaskProgressByName")

function GetActivityDungeon1001_TaskTipsUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.RewardList = ui:GetChild("RewardList")
  uis.TaskProgress = GetActivityDungeon1001_TaskProgressUis(ui:GetChild("TaskProgress"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
