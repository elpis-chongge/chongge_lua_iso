require("ActivityDungeon1_Sign_ItemFrameByName")
require("ActivityDungeon1_Sign_CardFrameByName")

function GetActivityDungeon1_Sign_AllFrameUis(ui)
  local uis = {}
  uis.ItemFrame = GetActivityDungeon1_Sign_ItemFrameUis(ui:GetChild("ItemFrame"))
  uis.CardFrame = GetActivityDungeon1_Sign_CardFrameUis(ui:GetChild("CardFrame"))
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
