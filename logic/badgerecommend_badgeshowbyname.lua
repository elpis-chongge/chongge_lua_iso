require("BadgeRecommend_BadgeShowIcon1ByName")
require("BadgeRecommend_BadgeShowIcon2ByName")

function GetBadgeRecommend_BadgeShowUis(ui)
  local uis = {}
  uis.BadgeIcon = GetBadgeRecommend_BadgeShowIcon1Uis(ui:GetChild("BadgeIcon"))
  uis.BadgeIcon1 = GetBadgeRecommend_BadgeShowIcon2Uis(ui:GetChild("BadgeIcon1"))
  uis.BadgeIcon2 = GetBadgeRecommend_BadgeShowIcon2Uis(ui:GetChild("BadgeIcon2"))
  uis.BadgeIcon3 = GetBadgeRecommend_BadgeShowIcon2Uis(ui:GetChild("BadgeIcon3"))
  uis.AllWearBtn = ui:GetChild("AllWearBtn")
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.WordList = ui:GetChild("WordList")
  uis.root = ui
  return uis
end
