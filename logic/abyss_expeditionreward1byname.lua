require("Abyss_ExpeditionRewardTotalByName")

function GetAbyss_ExpeditionReward1Uis(ui)
  local uis = {}
  uis.Total = GetAbyss_ExpeditionRewardTotalUis(ui:GetChild("Total"))
  uis.RewardList = ui:GetChild("RewardList")
  uis.root = ui
  return uis
end
