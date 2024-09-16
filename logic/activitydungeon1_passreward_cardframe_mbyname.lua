require("ActivityDungeon1_PassReward_ItemCardPicByName")

function GetActivityDungeon1_PassReward_CardFrame_MUis(ui)
  local uis = {}
  uis.ItemCardPic = GetActivityDungeon1_PassReward_ItemCardPicUis(ui:GetChild("ItemCardPic"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
