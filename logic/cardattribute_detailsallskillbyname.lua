require("CommonResource_PopupBgByName")

function GetCardAttribute_DetailsAllSkillUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.SpclSkillTipsList = ui:GetChild("SpclSkillTipsList")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.root = ui
  return uis
end
