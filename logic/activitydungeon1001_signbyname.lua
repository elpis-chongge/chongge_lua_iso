require("CommonResource_BackGroundByName")
require("ActivityDungeon1001_Sign_RewardListByName")
require("ActivityDungeon1001_Sign_TimeByName")

function GetActivityDungeon1001_SignUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.RewardList = GetActivityDungeon1001_Sign_RewardListUis(ui:GetChild("RewardList"))
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.Time = GetActivityDungeon1001_Sign_TimeUis(ui:GetChild("Time"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
