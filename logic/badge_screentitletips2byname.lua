require("Badge_ScreenTitleByName")

function GetBadge_ScreenTitleTips2Uis(ui)
  local uis = {}
  uis.ScreenTitle = GetBadge_ScreenTitleUis(ui:GetChild("ScreenTitle"))
  uis.TipsList = ui:GetChild("TipsList")
  uis.root = ui
  return uis
end
