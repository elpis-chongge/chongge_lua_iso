require("Badge_PartsInfoByName")
require("Badge_BadgeDetailsByName")
require("Badge_BadgeLevelUpByName")

function GetBadge_BadgeDetailsLevelUpUis(ui)
  local uis = {}
  uis.PartsInfo = GetBadge_PartsInfoUis(ui:GetChild("PartsInfo"))
  uis.BadgeDetails = GetBadge_BadgeDetailsUis(ui:GetChild("BadgeDetails"))
  uis.BadgeLevelUp = GetBadge_BadgeLevelUpUis(ui:GetChild("BadgeLevelUp"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
