require("CommonResource_PopupBgByName")
require("CardAttribute_AttributeDes1ByName")

function GetCardAttribute_BadgeCardInfoUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.CardScreen1 = GetCardAttribute_AttributeDes1Uis(ui:GetChild("CardScreen1"))
  uis.SpclSkillTipsList = ui:GetChild("SpclSkillTipsList")
  uis.SwitchBtn = ui:GetChild("SwitchBtn")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
