require("ActivityDungeon1002_Sign_ItemFrameByName")
require("ActivityDungeon1002_Sign_CardFrameByName")

function GetActivityDungeon1002_Sign_AllFrameUis(ui)
  local uis = {}
  uis.ItemFrame = GetActivityDungeon1002_Sign_ItemFrameUis(ui:GetChild("ItemFrame"))
  uis.CardFrame = GetActivityDungeon1002_Sign_CardFrameUis(ui:GetChild("CardFrame"))
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
