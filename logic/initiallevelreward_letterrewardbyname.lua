require("InitialLevelReward_GetWord2ByName")
require("InitialLevelReward_GetWord3ByName")

function GetInitialLevelReward_LetterRewardUis(ui)
  local uis = {}
  uis.ConditionWordTxt = ui:GetChild("ConditionWordTxt")
  uis.ItemList = ui:GetChild("ItemList")
  uis.Word1Btn = ui:GetChild("Word1Btn")
  uis.Word2 = GetInitialLevelReward_GetWord2Uis(ui:GetChild("Word2"))
  uis.Word3 = GetInitialLevelReward_GetWord3Uis(ui:GetChild("Word3"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
