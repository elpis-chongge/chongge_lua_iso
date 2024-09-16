require("BadgeRecommend_Mark1ByName")
require("BadgeRecommend_Mark2ByName")
require("BadgeRecommend_Mark3ByName")

function GetBadgeRecommend_WearStateUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.Mark1 = GetBadgeRecommend_Mark1Uis(ui:GetChild("Mark1"))
  uis.Mark2 = GetBadgeRecommend_Mark2Uis(ui:GetChild("Mark2"))
  uis.Mark3 = GetBadgeRecommend_Mark3Uis(ui:GetChild("Mark3"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
