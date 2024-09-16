require("ActivityDungeon1002_PassReward_ItemFrame_MByName")
require("ActivityDungeon1002_PassReward_CardFrame_MByName")

function GetActivityDungeon1002_PassReward_AllFrame_MUis(ui)
  local uis = {}
  uis.ItemFrame = GetActivityDungeon1002_PassReward_ItemFrame_MUis(ui:GetChild("ItemFrame"))
  uis.CardFrame = GetActivityDungeon1002_PassReward_CardFrame_MUis(ui:GetChild("CardFrame"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
