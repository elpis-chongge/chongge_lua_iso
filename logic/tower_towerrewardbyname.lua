require("CommonResource_PopupBgByName")
require("Tower_RewardTipsByName")

function GetTower_TowerRewardUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.RewardTips = GetTower_RewardTipsUis(ui:GetChild("RewardTips"))
  uis.root = ui
  return uis
end
