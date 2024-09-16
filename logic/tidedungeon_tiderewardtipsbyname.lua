require("TideDungeon_TideRewardState2ByName")
require("TideDungeon_TideRewardState1ByName")
require("TideDungeon_TideRewardState3ByName")

function GetTideDungeon_TideRewardTipsUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.RewardList = ui:GetChild("RewardList")
  uis.Progress = GetTideDungeon_TideRewardState2Uis(ui:GetChild("Progress"))
  uis.Get = GetTideDungeon_TideRewardState1Uis(ui:GetChild("Get"))
  uis.Complete = GetTideDungeon_TideRewardState3Uis(ui:GetChild("Complete"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
