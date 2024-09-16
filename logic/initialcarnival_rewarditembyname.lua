require("InitialCarnival_ItemFrameByName")
require("InitialCarnival_GetIntegralByName")

function GetInitialCarnival_RewardItemUis(ui)
  local uis = {}
  uis.RewardItem = GetInitialCarnival_ItemFrameUis(ui:GetChild("RewardItem"))
  uis.GetIntegral = GetInitialCarnival_GetIntegralUis(ui:GetChild("GetIntegral"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
