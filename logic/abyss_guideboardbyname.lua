require("CommonResource_PopupBgByName")
require("Abyss_GuideBoardTipsByName")

function GetAbyss_GuideBoardUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.GuideBoardTips = GetAbyss_GuideBoardTipsUis(ui:GetChild("GuideBoardTips"))
  uis.root = ui
  return uis
end
