require("CommonResource_ItemCardPicByName")
require("CommonResource_ItemTimeByName")

function GetSign_ItemFrameUis(ui)
  local uis = {}
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.ItemCardPic = GetCommonResource_ItemCardPicUis(ui:GetChild("ItemCardPic"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.ItemTime = GetCommonResource_ItemTimeUis(ui:GetChild("ItemTime"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.typeCtr = ui:GetController("type")
  uis.root = ui
  return uis
end
