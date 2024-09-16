require("CommonResource_PopupBgByName")
require("BadgeRecommend_RecommendTipsByName")

function GetBadgeRecommend_RecommendUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.RecommendTips = GetBadgeRecommend_RecommendTipsUis(ui:GetChild("RecommendTips"))
  uis.root = ui
  return uis
end
