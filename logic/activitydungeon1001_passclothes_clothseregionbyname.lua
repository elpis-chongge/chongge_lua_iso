require("ActivityDungeon1001_PassClothes_WordByName")
require("ActivityDungeon1001_PassClothes_CardQBByName")
require("ActivityDungeon1001_PassClothes_BuyRewardByName")

function GetActivityDungeon1001_PassClothes_ClothseRegionUis(ui)
  local uis = {}
  uis.Word = GetActivityDungeon1001_PassClothes_WordUis(ui:GetChild("Word"))
  uis.CardQB = GetActivityDungeon1001_PassClothes_CardQBUis(ui:GetChild("CardQB"))
  uis.BuyReward = GetActivityDungeon1001_PassClothes_BuyRewardUis(ui:GetChild("BuyReward"))
  uis.BuyBtn = ui:GetChild("BuyBtn")
  uis.root = ui
  return uis
end
