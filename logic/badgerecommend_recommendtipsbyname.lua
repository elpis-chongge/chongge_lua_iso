require("BadgeRecommend_TitleByName")
require("BadgeRecommend_BadgeShowListByName")
require("BadgeRecommend_AttributeShowByName")

function GetBadgeRecommend_RecommendTipsUis(ui)
  local uis = {}
  uis.Title = GetBadgeRecommend_TitleUis(ui:GetChild("Title"))
  uis.BadgeShow = GetBadgeRecommend_BadgeShowListUis(ui:GetChild("BadgeShow"))
  uis.AttributeShow = GetBadgeRecommend_AttributeShowUis(ui:GetChild("AttributeShow"))
  uis.PageNumberList = ui:GetChild("PageNumberList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
