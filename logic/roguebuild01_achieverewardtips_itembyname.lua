require("RogueBuild01_AchieveRewardTips_ItemCardPicByName")

function GetRogueBuild01_AchieveRewardTips_ItemUis(ui)
  local uis = {}
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.ItemCardPic = GetRogueBuild01_AchieveRewardTips_ItemCardPicUis(ui:GetChild("ItemCardPic"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.c1Ctr = ui:GetController("c1")
  uis.typeCtr = ui:GetController("type")
  uis.numberCtr = ui:GetController("number")
  uis.GetCtr = ui:GetController("Get")
  uis.root = ui
  return uis
end
