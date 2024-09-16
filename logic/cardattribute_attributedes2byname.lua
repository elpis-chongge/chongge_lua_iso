require("CommonResource_PopupBgByName")
require("CardAttribute_AttributeDes1ByName")

function GetCardAttribute_AttributeDes2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.CardScreen1 = GetCardAttribute_AttributeDes1Uis(ui:GetChild("CardScreen1"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.root = ui
  return uis
end
