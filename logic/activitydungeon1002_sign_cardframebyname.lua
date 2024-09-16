require("ActivityDungeon1002_Sign_ItemCardPicByName")

function GetActivityDungeon1002_Sign_CardFrameUis(ui)
  local uis = {}
  uis.ItemCardPic = GetActivityDungeon1002_Sign_ItemCardPicUis(ui:GetChild("ItemCardPic"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
