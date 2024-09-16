require("ActivityDungeon1_PassReward_MidTwoItemByName")
require("ActivityDungeon1_PassReward_LevelTitleByName")

function GetActivityDungeon1_PassReward_MidTwoUis(ui)
  local uis = {}
  uis.Reward1 = GetActivityDungeon1_PassReward_MidTwoItemUis(ui:GetChild("Reward1"))
  uis.Reward2 = GetActivityDungeon1_PassReward_MidTwoItemUis(ui:GetChild("Reward2"))
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.Title = GetActivityDungeon1_PassReward_LevelTitleUis(ui:GetChild("Title"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
