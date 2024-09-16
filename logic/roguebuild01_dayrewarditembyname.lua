require("RogueBuild01_DayRewardItemState1ByName")
require("RogueBuild01_DayRewardItemState3ByName")
require("RogueBuild01_DayRewardItemState4ByName")

function GetRogueBuild01_DayRewardItemUis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.ItemList = ui:GetChild("ItemList")
  uis.State1 = GetRogueBuild01_DayRewardItemState1Uis(ui:GetChild("State1"))
  uis.State2Btn = ui:GetChild("State2Btn")
  uis.State3 = GetRogueBuild01_DayRewardItemState3Uis(ui:GetChild("State3"))
  uis.State4 = GetRogueBuild01_DayRewardItemState4Uis(ui:GetChild("State4"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
