require("RogueBuild01_AchieveRewardTips_ProgressByName")
require("RogueBuild01_AchieveRewardTips_GetWordByName")

function GetRogueBuild01_AchieveRewardTips_TaskUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Progress = GetRogueBuild01_AchieveRewardTips_ProgressUis(ui:GetChild("Progress"))
  uis.GetWord = GetRogueBuild01_AchieveRewardTips_GetWordUis(ui:GetChild("GetWord"))
  uis.ItemList = ui:GetChild("ItemList")
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
