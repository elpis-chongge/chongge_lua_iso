require("CommonResource_PopupBgByName")
require("Badge_LevelUpTipsContentByName")

function GetBadge_LevelUpTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.LevelUpTipsContent = GetBadge_LevelUpTipsContentUis(ui:GetChild("LevelUpTipsContent"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.root = ui
  return uis
end
