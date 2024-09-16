require("Passport_Clothes_ItemCardPicByName")

function GetPassport_Clothes_ItemFrameUis(ui)
  local uis = {}
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.ItemCardPic = GetPassport_Clothes_ItemCardPicUis(ui:GetChild("ItemCardPic"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.c1Ctr = ui:GetController("c1")
  uis.typeCtr = ui:GetController("type")
  uis.numberCtr = ui:GetController("number")
  uis.buyCtr = ui:GetController("buy")
  uis.root = ui
  return uis
end
