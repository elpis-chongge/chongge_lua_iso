require("ActivityDungeon1001_PassReward_MiddleRegionByName")
require("ActivityDungeon1001_PassReward_StartTwoByName")
require("ActivityDungeon1001_PassReward_EndTwoByName")

function GetActivityDungeon1001_PassReward_RewardRegionUis(ui)
  local uis = {}
  uis.MiddleList = GetActivityDungeon1001_PassReward_MiddleRegionUis(ui:GetChild("MiddleList"))
  uis.StartTwo = GetActivityDungeon1001_PassReward_StartTwoUis(ui:GetChild("StartTwo"))
  uis.EndTwo = GetActivityDungeon1001_PassReward_EndTwoUis(ui:GetChild("EndTwo"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
