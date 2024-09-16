require("CommonResource_BackGroundByName")
require("TideDungeon_TideRewardTitleByName")
require("TideDungeon_TideRewardTipsListByName")

function GetTideDungeon_TideRewardUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.RewardTitle = GetTideDungeon_TideRewardTitleUis(ui:GetChild("RewardTitle"))
  uis.RewardTipsList = GetTideDungeon_TideRewardTipsListUis(ui:GetChild("RewardTipsList"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.Tab1Btn = ui:GetChild("Tab1Btn")
  uis.Tab2Btn = ui:GetChild("Tab2Btn")
  uis.Tab3Btn = ui:GetChild("Tab3Btn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
