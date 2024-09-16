require("CommonResource_PopupBgByName")
require("Badge_SuitTipsByName")

function GetBadge_SuitScreenUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.SuitTips = GetBadge_SuitTipsUis(ui:GetChild("SuitTips"))
  uis.root = ui
  return uis
end
