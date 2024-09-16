require("CommonResource_PopupBgByName")
require("Arena_PopupByName")
require("Arena_SeasonTips1ByName")

function GetArena_SeasonTips2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Popup_S = GetArena_PopupUis(ui:GetChild("Popup_S"))
  uis.SeasonTips1 = GetArena_SeasonTips1Uis(ui:GetChild("SeasonTips1"))
  uis.root = ui
  return uis
end
