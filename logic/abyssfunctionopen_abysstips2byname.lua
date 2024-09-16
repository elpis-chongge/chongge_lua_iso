require("CommonResource_PopupBgByName")
require("AbyssFunctionOpen_AbyssTips1ByName")

function GetAbyssFunctionOpen_AbyssTips2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.AbyssTips1 = GetAbyssFunctionOpen_AbyssTips1Uis(ui:GetChild("AbyssTips1"))
  uis.root = ui
  return uis
end
