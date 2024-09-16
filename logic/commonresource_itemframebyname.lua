require("CommonResource_ItemCardPicByName")
require("CommonResource_ItemTimeByName")
require("CommonResource_ItemSweepByName")
require("CommonResource_BadgeHeadShowByName")

function GetCommonResource_ItemFrameUis(ui)
  local uis = {}
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.ItemCardPic = GetCommonResource_ItemCardPicUis(ui:GetChild("ItemCardPic"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.ItemTime = GetCommonResource_ItemTimeUis(ui:GetChild("ItemTime"))
  uis.ItemSweep = GetCommonResource_ItemSweepUis(ui:GetChild("ItemSweep"))
  uis.BadgeHeadShow = GetCommonResource_BadgeHeadShowUis(ui:GetChild("BadgeHeadShow"))
  uis.NumberProgressBar = ui:GetChild("NumberProgressBar")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.typeCtr = ui:GetController("type")
  uis.numberCtr = ui:GetController("number")
  uis.sweepCtr = ui:GetController("sweep")
  uis.synthesisCtr = ui:GetController("synthesis")
  uis.badgeCtr = ui:GetController("badge")
  uis.root = ui
  return uis
end
