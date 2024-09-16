require("CommonResource_PopupBgByName")
require("RaidBoss_QuickRewardContentByName")

function GetRaidBoss_QuickRewardUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.QuickRewardContent = GetRaidBoss_QuickRewardContentUis(ui:GetChild("QuickRewardContent"))
  uis.root = ui
  return uis
end
