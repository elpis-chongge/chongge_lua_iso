require("InitialLevelReward_ItemFrameByName")
require("InitialLevelReward_CardFrameByName")

function GetInitialLevelReward_AllFrameUis(ui)
  local uis = {}
  uis.ItemFrame = GetInitialLevelReward_ItemFrameUis(ui:GetChild("ItemFrame"))
  uis.CardFrame = GetInitialLevelReward_CardFrameUis(ui:GetChild("CardFrame"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
