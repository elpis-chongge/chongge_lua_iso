require("Badge_ContrastTipsByName")
require("Badge_DetailsInfoByName")
require("Badge_WearBadgeContainerByName")

function GetBadge_BadgeDetailsUis(ui)
  local uis = {}
  uis.ContrastTips = GetBadge_ContrastTipsUis(ui:GetChild("ContrastTips"))
  uis.DetailsInfo = GetBadge_DetailsInfoUis(ui:GetChild("DetailsInfo"))
  uis.WearBadgeContainer = GetBadge_WearBadgeContainerUis(ui:GetChild("WearBadgeContainer"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
