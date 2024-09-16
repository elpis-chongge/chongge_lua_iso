require("RogueBuild01_AchieveRewardTips_TaskByName")
require("RogueBuild01_LetterRegionByName")

function GetRogueBuild01_AchieveRewardTips1Uis(ui)
  local uis = {}
  uis.TabList = ui:GetChild("TabList")
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.WordList = ui:GetChild("WordList")
  uis.Task = GetRogueBuild01_AchieveRewardTips_TaskUis(ui:GetChild("Task"))
  uis.LetterRegion = GetRogueBuild01_LetterRegionUis(ui:GetChild("LetterRegion"))
  uis.root = ui
  return uis
end
