require("BadgeRecommend_RecommendByName")

function GetBadgeRecommend_RecommendWindowUis(ui)
  local uis = {}
  uis.Main = GetBadgeRecommend_RecommendUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
