require("CommonResource_PopupBgByName")
require("AbyssReward_RewardTipsByName")

function GetAbyssReward_AbyssRewardUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.RewardTips = GetAbyssReward_RewardTipsUis(ui:GetChild("RewardTips"))
  uis.root = ui
  return uis
end
