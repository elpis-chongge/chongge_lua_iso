require("CommonResource_BackGroundByName")
require("ActivityDungeon1_Sign_RewardListByName")
require("ActivityDungeon1_Sign_TimeByName")

function GetActivityDungeon1_SignUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.RewardList = GetActivityDungeon1_Sign_RewardListUis(ui:GetChild("RewardList"))
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.Time = GetActivityDungeon1_Sign_TimeUis(ui:GetChild("Time"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
