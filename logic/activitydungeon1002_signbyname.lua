require("CommonResource_BackGroundByName")
require("ActivityDungeon1002_Sign_RewardListByName")
require("ActivityDungeon1002_Sign_TimeByName")

function GetActivityDungeon1002_SignUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.RewardList = GetActivityDungeon1002_Sign_RewardListUis(ui:GetChild("RewardList"))
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.Time = GetActivityDungeon1002_Sign_TimeUis(ui:GetChild("Time"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
