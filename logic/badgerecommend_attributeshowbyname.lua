require("BadgeRecommend_Attribute1ByName")
require("BadgeRecommend_Attribute2ByName")

function GetBadgeRecommend_AttributeShowUis(ui)
  local uis = {}
  uis.Attribute1 = GetBadgeRecommend_Attribute1Uis(ui:GetChild("Attribute1"))
  uis.Attribute2 = GetBadgeRecommend_Attribute2Uis(ui:GetChild("Attribute2"))
  uis.root = ui
  return uis
end
