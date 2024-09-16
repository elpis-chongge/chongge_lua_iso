require("DailyTask_ItemCardPicByName")
require("CommonResource_RedDotByName")

function GetDailyTask_RewardItem4Uis(ui)
  local uis = {}
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.PicNumberTxt = ui:GetChild("PicNumberTxt")
  uis.ItemCardPic = GetDailyTask_ItemCardPicUis(ui:GetChild("ItemCardPic"))
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.typeCtr = ui:GetController("type")
  uis.root = ui
  return uis
end
