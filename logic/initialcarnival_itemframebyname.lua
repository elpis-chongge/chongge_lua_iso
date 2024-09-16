require("CommonResource_ItemCardPicByName")

function GetInitialCarnival_ItemFrameUis(ui)
  local uis = {}
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.ItemCardPic = GetCommonResource_ItemCardPicUis(ui:GetChild("ItemCardPic"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.c1Ctr = ui:GetController("c1")
  uis.typeCtr = ui:GetController("type")
  uis.root = ui
  return uis
end
