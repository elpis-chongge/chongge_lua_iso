require("CommonResource_PopupBgByName")
require("Card_AttributeDes1ByName")

function GetCard_AttributeDes2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.CardScreen1 = GetCard_AttributeDes1Uis(ui:GetChild("CardScreen1"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.root = ui
  return uis
end
