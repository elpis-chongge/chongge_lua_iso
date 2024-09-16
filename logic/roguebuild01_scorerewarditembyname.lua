require("RogueBuild01_ScoreRewardItemCardPicByName")
require("CommonResource_RedDotByName")

function GetRogueBuild01_ScoreRewardItemUis(ui)
  local uis = {}
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.ItemCardPic = GetRogueBuild01_ScoreRewardItemCardPicUis(ui:GetChild("ItemCardPic"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.typeCtr = ui:GetController("type")
  uis.root = ui
  return uis
end
