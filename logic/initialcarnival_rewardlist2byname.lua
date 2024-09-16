require("CommonResource_PopupBgByName")
require("InitialCarnival_RewardList1ByName")

function GetInitialCarnival_RewardList2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.RewardList1 = GetInitialCarnival_RewardList1Uis(ui:GetChild("RewardList1"))
  uis.root = ui
  return uis
end
