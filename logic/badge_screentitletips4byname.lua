require("Badge_ScreenTitleByName")

function GetBadge_ScreenTitleTips4Uis(ui)
  local uis = {}
  uis.ScreenTitle = GetBadge_ScreenTitleUis(ui:GetChild("ScreenTitle"))
  uis.ScreenTitleBtn = ui:GetChild("ScreenTitleBtn")
  uis.TipsList = ui:GetChild("TipsList")
  uis.root = ui
  return uis
end
