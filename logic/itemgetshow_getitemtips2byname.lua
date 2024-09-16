require("ItemGetShow_PopupBgByName")
require("ItemGetShow_GetItemTips1ByName")

function GetItemGetShow_GetItemTips2Uis(ui)
  local uis = {}
  uis.PopupBg = GetItemGetShow_PopupBgUis(ui:GetChild("PopupBg"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.GetItemTips1 = GetItemGetShow_GetItemTips1Uis(ui:GetChild("GetItemTips1"))
  uis.root = ui
  return uis
end
