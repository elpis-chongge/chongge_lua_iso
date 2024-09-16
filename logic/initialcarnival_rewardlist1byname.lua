require("InitialCarnival_CurrentIntegralByName")

function GetInitialCarnival_RewardList1Uis(ui)
  local uis = {}
  uis.RewardItemList = ui:GetChild("RewardItemList")
  uis.CurrentIntegral = GetInitialCarnival_CurrentIntegralUis(ui:GetChild("CurrentIntegral"))
  uis.root = ui
  return uis
end
