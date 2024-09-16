require("RogueBuild01_CoverRewardExpandByName")
require("CommonResource_RedDotByName")

function GetRogueBuild01_CoverScoreRewardBtnUis(ui)
  local uis = {}
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.RewardExpand = GetRogueBuild01_CoverRewardExpandUis(ui:GetChild("RewardExpand"))
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
