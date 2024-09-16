require("BadgeRecommend_WearStateByName")

function GetBadgeRecommend_TitleUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.StarList = ui:GetChild("StarList")
  uis.WearState = GetBadgeRecommend_WearStateUis(ui:GetChild("WearState"))
  uis.root = ui
  return uis
end
