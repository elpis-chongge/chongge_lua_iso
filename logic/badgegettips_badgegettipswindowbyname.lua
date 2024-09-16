require("BadgeGetTips_BadgeGetTipsByName")

function GetBadgeGetTips_BadgeGetTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetBadgeGetTips_BadgeGetTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
