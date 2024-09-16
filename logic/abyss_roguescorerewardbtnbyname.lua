require("Abyss_RogueRewardExpandByName")
require("CommonResource_RedDotByName")

function GetAbyss_RogueScoreRewardBtnUis(ui)
  local uis = {}
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.RewardExpand = GetAbyss_RogueRewardExpandUis(ui:GetChild("RewardExpand"))
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
